---
layout: about
title: about
permalink: /
subtitle: >
  B.Tech ECE (Data Science) · <a href="https://www.srmist.edu.in/" target="_blank">SRMIST Kattankulathur</a> · Chennai, India

profile:
  align: right
  image: prof_pic_1.jpg
  image_circular: false
  more_info: >
    <p>📧 mnaditya05@gmail.com</p>
    <p>📍 Chennai, India</p>

selected_papers: true
social: true

announcements:
  enabled: false

latest_posts:
  enabled: false
---

I am a final-year B.Tech student in Electronics and Communication Engineering with a specialization in Data Science at **SRMIST Kattankulathur**. My research sits at the intersection of **federated learning**, **medical image analysis**, **explainable AI (XAI)**, and **TinyML** — building AI systems that are efficient, trustworthy, and deployable in resource-constrained environments.

I have had the opportunity to work with research groups at **IIT Kharagpur**, **IIT Jammu**, **NIT Kurukshetra**, **NIT Trichy**, and **IIIT Allahabad**, as well as industry experience at **SRM Technologies** and **Farmience AgroTech**. My work spans federated learning for healthcare, document image forgery detection, dental X-ray segmentation, and financial distress prediction.

I have authored and co-authored **11 publications** — including journal articles, conference papers, and book chapters — in venues spanning computer vision, biomedical engineering, and applied AI. I am actively seeking research opportunities (RA/MS/PhD) in federated learning, privacy-preserving ML, and efficient deep learning.

**Research Interests:** Federated Learning · Medical Image Analysis · Explainable AI · TinyML · Self-Supervised Learning · Agentic AI

<script>
  document.addEventListener("DOMContentLoaded", function () {
    var photos = [
      "{{ '/assets/img/prof_pic_1.jpg' | relative_url }}",
      "{{ '/assets/img/prof_pic_2.png' | relative_url }}"
    ];
    var chosen = photos[Math.floor(Math.random() * photos.length)];
    var img = document.querySelector(".profile img");
    if (img) { img.src = chosen; }
  });
</script>
