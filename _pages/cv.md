---
layout: cv
permalink: /cv/
title: cv
nav: true
nav_order: 5
cv_pdf: /assets/pdf/M_N_ADITYA_CV.pdf
description: Curriculum Vitae of M N Aditya — ECE undergraduate researcher specialising in federated learning, medical image segmentation, and agentic LLM systems.
---

<style>
.cv-logo {
  display: block;
  width: 48px;
  height: 48px;
  object-fit: contain;
  margin: 6px auto 4px;
  border-radius: 4px;
  background: #fff;
  padding: 2px;
  box-shadow: 0 1px 3px rgba(0,0,0,0.2);
}
</style>

<script>
document.addEventListener("DOMContentLoaded", function () {
  var logoMap = {
    "Indian Institute of Technology, Kharagpur":                         "/assets/img/iit_kgp_logo.png",
    "Farmience AgroTech":                                                "/assets/img/farmience_logo.jpg",
    "DST-ANRF (SERB) Funded Project, SRMIST":                           "/assets/img/srmist_logo.jpg",
    "SRM Technologies Private Limited":                                  "/assets/img/srm_tech_logo.jpg",
    "National Institute of Technology, Kurukshetra":                     "/assets/img/nit_kuk_logo.png",
    "Indian Institute of Technology, Jammu":                             "/assets/img/iit_jammu_logo.png",
    "Intel Corporation — Unnati Industrial Training Programme":          "/assets/img/intel_logo.svg",
    "National Institute of Technology, Tiruchirappalli":                 "/assets/img/nit_trichy_logo.png",
    "Indian Institute of Information Technology, Allahabad":             "/assets/img/iiit_allahabad_logo.png"
  };

  document.querySelectorAll("li.list-group-item").forEach(function (item) {
    // Company name is in: h6 that does NOT have class "title"
    // In the rendered HTML: <h6 class="ml-1 ml-md-4" style="font-size: 0.95rem">
    var companyEl = item.querySelector("h6:not(.title)");
    if (!companyEl) return;
    var company = companyEl.textContent.trim();
    var logoSrc = logoMap[company];
    if (!logoSrc) return;

    // Date column table is: div.date-column > table.table-cv > tbody
    var dateCol = item.querySelector("div.date-column");
    if (!dateCol) return;
    var tbody = dateCol.querySelector("table.table-cv tbody");
    if (!tbody) return;

    // Insert logo as first row
    var tr = document.createElement("tr");
    var td = document.createElement("td");
    var img = document.createElement("img");
    img.src = logoSrc;
    img.alt = company + " logo";
    img.className = "cv-logo";
    td.appendChild(img);
    tr.appendChild(td);
    tbody.insertBefore(tr, tbody.firstChild);
  });
});
</script>
