# _plugins/cv_logo_inject.rb
#
# 1. Rewrites year-only date badges on the CV page with month+year (e.g. "Jun 2026 - Jul 2026")
# 2. Injects institution logos into the left date column via JS

MONTHS = %w[Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec]

def cv_format_date(d)
  s = d.to_s.strip
  return s if s == "present" || s.empty?
  parts = s.split('-')
  return parts[0] if parts.length < 2 || parts[1].to_i == 0
  "#{MONTHS[parts[1].to_i - 1]} #{parts[0]}"
end

Jekyll::Hooks.register :pages, :post_render do |page|
  next unless page.url == "/cv/" || page.url == "/cv/index.html"
  next unless page.output_ext == ".html"

  # --- 1. Rewrite date badges with month+year ---
  # cv.yml structure: data["cv"]["cv"]["sections"]["Experience"] / ["Education"]
  cv_root = ((page.site.data["cv"] || {})["cv"] || {})
  sections = cv_root["sections"] || {}
  # Gem renders Experience before Education regardless of YAML order
  all_entries = (sections["Experience"] || []) + (sections["Education"] || [])

  output = page.output.dup
  all_entries.each do |entry|
    s = cv_format_date(entry["start_date"])
    e = cv_format_date(entry["end_date"])
    full_date = "#{s} - #{e}"
    # Replace the FIRST remaining year-only badge (e.g. ">2026 - present<")
    output.sub!(%r{(<span\b[^>]*\bmin-width:\s*75px[^>]*>)\d{4}[^<]*(</span>)}) do
      "#{$1}#{full_date}#{$2}"
    end
  end
  page.output = output

  # --- 2. Inject logos + suppress bullets ---
  script = <<~JS
    <style>
    .cv-logo {
      display: block;
      width: 88px;
      height: 88px;
      object-fit: contain;
      margin: 0 auto 8px auto;
      border-radius: 6px;
      background: #fff;
      padding: 3px;
      box-shadow: 0 1px 4px rgba(0,0,0,.25);
    }
    .cv .card ul.list-group > li.list-group-item {
      list-style: none !important;
    }
    .cv .card ul.list-group > li.list-group-item::marker {
      content: none !important;
    }
    div.date-column.has-cv-logo {
      display: flex;
      flex-direction: column;
      align-items: center;
      padding-top: 2.5rem;
      width: 105px;
    }
    </style>
    <script>
    document.addEventListener("DOMContentLoaded", function () {
      var logoMap = {
        "Indian Institute of Technology, Kharagpur":                        "/assets/img/iit_kgp_logo.png",
        "Farmience AgroTech":                                               "/assets/img/farmience_logo.jpg",
        "DST-ANRF (SERB) Funded Project, SRMIST":                          "/assets/img/srmist_logo.jpg",
        "SRM Technologies Private Limited":                                 "/assets/img/srm_tech_logo.jpg",
        "National Institute of Technology, Kurukshetra":                    "/assets/img/nit_kuk_logo.png",
        "Indian Institute of Technology, Jammu":                            "/assets/img/iit_jammu_logo.png",
        "Intel Corporation — Unnati Industrial Training Programme":    "/assets/img/intel_logo.svg",
        "National Institute of Technology, Tiruchirappalli":                "/assets/img/nit_trichy_logo.png",
        "Indian Institute of Information Technology, Allahabad":            "/assets/img/iiit_allahabad_logo.png",
        "SRM Institute of Science and Technology":                          "/assets/img/srmist_logo.jpg"
      };
      document.querySelectorAll("li.list-group-item").forEach(function (item) {
        var companyEl = item.querySelector("h6:not(.title)");
        if (!companyEl) return;
        var company = companyEl.textContent.trim();
        var logoSrc = logoMap[company];
        if (!logoSrc) return;
        var dateCol = item.querySelector("div.date-column");
        if (!dateCol) return;
        var img = document.createElement("img");
        img.src = logoSrc;
        img.alt = company + " logo";
        img.className = "cv-logo";
        dateCol.insertBefore(img, dateCol.firstChild);
        dateCol.classList.add("has-cv-logo");
      });
    });
    </script>
  JS

  page.output = page.output.sub("</body>", script + "\n</body>")
end
