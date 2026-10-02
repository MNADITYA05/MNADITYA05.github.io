---
layout: page
title: DealSight
description: NLP pipeline for automated extraction, summarisation, and risk-flagging of M&A deal terms from unstructured financial documents.
importance: 4
category: work
---

Legal and financial analysts spend hours reading merger agreements to extract key terms — price adjustments, MAC clauses, termination fees, and closing conditions. **DealSight** automates this with a multi-stage NLP pipeline that ingests raw deal documents, extracts structured fields, summarises each clause, and flags non-standard or high-risk language.

A retrieval-augmented generation (RAG) layer allows analysts to query any deal in natural language — *"What are the termination fee provisions?"* — and receive cited, grounded answers from the source document.

**Key contributions**
- Named-entity recognition fine-tuned on financial agreements to extract deal parties, values, and dates.
- Clause-level risk scoring based on deviation from market-standard language.
- RAG interface with source citation for analyst Q&A.

**Tech stack:** Python · spaCy · Hugging Face Transformers · LangChain · FAISS · Streamlit
