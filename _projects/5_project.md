---
layout: page
title: Loan Default Prediction
description: Interpretable ML system for retail loan default prediction with LIME explanations, deployed as a REST API for credit officers.
importance: 5
category: work
github: MNADITYA05/Loan
---

Credit risk assessment for retail loans requires both accuracy and interpretability — a black-box model that a credit officer cannot explain is a regulatory liability. This project delivers an interpretable gradient-boosted classifier trained on borrower demographics, repayment history, and loan characteristics, with **LIME** explanations generated per applicant.

The model is served as a FastAPI REST endpoint; a lightweight dashboard lets credit officers submit applicant data, view the default probability, and inspect the top factors driving the prediction in plain language.

**Key contributions**
- End-to-end pipeline from raw CSV ingestion to production-ready REST API.
- LIME explanations rendered as ranked factor lists for non-technical users.
- Threshold tuning to balance precision and recall per business risk appetite.

**Tech stack:** Python · XGBoost · LIME · FastAPI · Docker · Streamlit
