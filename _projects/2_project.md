---
layout: page
title: TinyFedPrompt
description: Federated prompt tuning of BioMedCLIP for privacy-preserving pneumonia detection on resource-constrained edge devices.
importance: 2
category: research
related_publications: true
github: MNADITYA05/TinyFedPrompt
---

Deploying medical AI on edge hardware while preserving patient privacy is a hard constraint in real-world clinical settings. **TinyFedPrompt** solves this by replacing full model fine-tuning with *prompt tuning* — learning a small set of soft tokens that steer a frozen BioMedCLIP backbone — and distributing the training across clients via federated learning.

Each client trains only its prompt tokens locally; raw patient images never leave the device. The aggregated prompt is then broadcast back, achieving competitive pneumonia detection accuracy at a fraction of the communication and compute cost of standard federated fine-tuning.

**Key contributions**
- First application of federated prompt tuning to a large vision-language medical model (BioMedCLIP).
- Runs on Raspberry Pi–class edge hardware; < 5 MB model update per round.
- Privacy guarantee: no raw data leaves the client at any point.

**Tech stack:** Python · PyTorch · CLIP · Flower (flwr) · Raspberry Pi · PACCAS 2026 {% cite aditya2026tinyfed %}
