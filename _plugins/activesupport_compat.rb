# _plugins/activesupport_compat.rb
# Suppresses the ActiveSupport to_time_preserves_timezone deprecation warning
# that causes the integration tests to fail on Ruby 3.3+ with newer ActiveSupport.
require "active_support" rescue nil
if defined?(ActiveSupport) && ActiveSupport.respond_to?(:to_time_preserves_timezone=)
  ActiveSupport.to_time_preserves_timezone = :zone
end
