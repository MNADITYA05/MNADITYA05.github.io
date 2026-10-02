---
layout: page
title: AI Financial Distress Prediction
description: Ensemble ML pipeline for early prediction of corporate financial distress, with SHAP-based feature attribution for regulatory transparency.
importance: 3
category: work
---

Predicting financial distress before it materialises allows lenders and regulators to intervene early. This project builds an end-to-end pipeline that ingests balance-sheet and cash-flow ratios, engineers lag features, and trains an ensemble of gradient-boosted trees to classify firms as distressed or healthy up to two fiscal years ahead.

**SHAP** (SHapley Additive exPlanations) values are computed for every prediction, surfacing the top drivers — liquidity ratios, debt coverage, and working capital trends — in a form auditors and regulators can inspect.

**Key contributions**
- Two-year-ahead early warning system with >90 % recall on held-out distressed firms.
- SHAP waterfall plots for individual firm explanations; SHAP beeswarm for portfolio-level feature importance.
- Handles class imbalance via SMOTE + cost-sensitive learning.

**Tech stack:** Python · XGBoost · LightGBM · SHAP · pandas · scikit-learn
