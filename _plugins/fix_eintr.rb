# _plugins/fix_eintr.rb
#
# Fixes Errno::EINTR / Errno::ETIMEDOUT / Errno::ECANCELED crashes in
# jekyll-minifier on macOS ARM.
#
# Root cause: Ruby's IO.copy_stream uses macOS fcopyfile(3) internally, which
# can be interrupted (EINTR), timeout (ETIMEDOUT), or be cancelled (ECANCELED)
# on Apple Silicon, especially for iCloud-Drive-backed files that aren't fully
# downloaded. This patch replaces the copy with a manual chunked read loop that
# avoids fcopyfile entirely, retries on EINTR, and skips on ETIMEDOUT/ECANCELED.

CHUNK = 1_048_576  # 1 MB

module FileUtils
  module_function

  def copy_file(src, dest, preserve = false)
    retries = 0
    begin
      buf = String.new("", capacity: CHUNK, encoding: Encoding::BINARY)
      File.open(src, 'rb') do |s|
        File.open(dest, 'wb') do |d|
          d.write(buf) while s.read(CHUNK, buf)
        end
      end
      if preserve
        st = File.stat(src)
        File.utime(st.atime, st.mtime, dest)
      end
    rescue Errno::EINTR
      retries += 1
      retry if retries < 5
      raise
    rescue Errno::ETIMEDOUT
      # iCloud-offloaded file: skip copy and warn, don't crash the build
      warn "[fix_eintr] ETIMEDOUT skipping #{src} (iCloud not downloaded?)"
    rescue Errno::ECANCELED
      # iCloud operation cancelled (common on macOS ARM for cloud-only files)
      warn "[fix_eintr] ECANCELED skipping #{src} (iCloud not downloaded?)"
    end
  end
end
