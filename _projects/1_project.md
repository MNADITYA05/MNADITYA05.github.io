---
layout: page
title: DentoSeg-SSL
description: Self-supervised panoramic dental X-ray segmentation with contrastive learning and U-Net, augmented with Grad-CAM explainability.
importance: 1
category: research
related_publications: true
---

Dental radiograph segmentation is a prerequisite for automated detection of cavities, fractures, and periodontal disease, yet large labelled datasets are expensive to obtain. **DentoSeg-SSL** addresses this by combining self-supervised contrastive pre-training with a U-Net segmentation head, enabling the model to extract robust features from unlabelled panoramic radiographs before fine-tuning on a small annotated set.

**Grad-CAM** heat-maps are generated post-hoc to highlight the regions driving each segmentation decision, bridging the gap between clinical trust and AI automation.

**Key contributions**
- Contrastive pre-training on unlabelled panoramic X-rays reduces annotation dependency.
- Attention-based U-Net decoder achieves accurate boundary delineation of teeth and surrounding structures.
- Grad-CAM integration provides per-prediction visual explanations accepted by clinical reviewers.

**Tech stack:** Python · PyTorch · U-Net · Grad-CAM · JSCP 2025 {% cite aditya2025dental %}
