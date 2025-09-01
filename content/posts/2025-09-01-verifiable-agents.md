---
title: "Verifiable Agents, Not Demos: A Problem-First Approach"
date: 2025-09-01
description: "Course notes from 'Building Agentic AI Applications with a Problem-First Approach' - moving beyond clever demos toward measurable, reliable agent systems with practical playbooks for problem-first framing, early evaluations, guardrails as product requirements, and iteration with data."
tags: ["ai", "agents", "machine-learning", "data-science", "automation", "llm", "llms", "analytics"]
categories: ["data-science"]
---

# Verifiable Agents, Not Demos: A Problem-First Approach

*Course notes from "Building Agentic AI Applications with a Problem-First Approach" (Maven)*

**TL;DR.** I took Aishwarya Naresh Reganti and Kiriti Badam's course to move beyond clever demos and toward **measurable, reliable agent systems**. The result: a practical playbook—**problem-first framing, early evaluations, guardrails as product requirements, and iteration with data**.

---

## Why I took this course

* I wanted a **systems lens** on Artificial Intelligence (**AI**) agents: when to use them, how to scope autonomy, and how to operate them in production under real constraints (cost, latency, reliability, compliance).
* I needed a **repeatable method** to go from a business problem → agent design → evaluation → rollout, not just a prompt that works on Friday and fails on Monday.
* The weekly **Chai & AI (tea-and-AI)** sessions were the **best hook**: people from varied backgrounds brought real problems, unpacked buzzwords, and shared concrete patterns—immediately useful for day-to-day work.

> "Ship agents like products, not prototypes."

---

![Course Certificate](/images/posts/verifiable-agents/Building-Agentic-AI-Applications-with-a-Problem-First-Approach-Certificate.jpg "Building Agentic AI Applications – Certificate")

---

## How my approach changed

Before: I'd "vibe-code" a promising flow, tune prompts, and call it a day.
After: I treat agents like **products with SLOs (Service Level Objectives)**.

* **Evaluations first:** define success upfront (small **gold datasets**, on-policy replays), then iterate.
* **Guardrails by design:** **PII (Personally Identifiable Information)** boundaries, tool allowlists, budget/rate limits, safe fallbacks, and audit trails.
* **Operate, don't demo:** observability for latency, success rate, and cost-per-action; clear rollback paths.
* **Iteration with data:** each change must move a metric, not just look smart.

---

## What in the coursework made it click

The syllabus blended *why* with *how*, then forced hands-on practice.

* **Workflow agents & prompting (2025 view):** planner–executor patterns, retries, idempotency, and skill-based prompting with **APO (Automatic Prompt Optimization)** treated as code with tests.
* **RAG (Retrieval-Augmented Generation) done right:** hybrid retrieval, rerankers, source-grounded answers, and memory types (episodic/semantic/tool-state) with **TTL (Time To Live)** and privacy controls.
* **Planning & protocols:** ReAct planning when uncertainty is high; standardizing tools via **MCP (Model Context Protocol)** so agents are portable across models.
* **Evaluation & guardrails:** moving from offline benchmarks to **on-policy** evaluations; turning policy into code (allow/deny lists, thresholds, **HITL (Human-in-the-Loop)** gates).
* **Operating agents:** observability, cost discipline, controlled rollouts, and clear failure taxonomies.

Homework pushed these ideas into muscle memory: build small gold datasets, write acceptance gates, and log every recommendation with sources and reason codes.

---

## Capstone (1 week): **STOCKWISE – AI Retail Intelligence**

*Agentic pricing & promotion planning for retailers*

**Problem.** Pricing/replenishment across stores and e-commerce is slow and error-prone; demand shifts and competitor moves create stockouts and margin leaks.

**Iteration 1 — Sense & Recommend (Workflow):**
Ingest sales, inventory, and competitor prices → compute price index, **DOS (Days of Supply)**, and an elasticity proxy → return a **price band + stock target**. Guardrails: **MAP (Minimum Advertised Price)**/min-margin/max-daily-change; escalate on violation.

**Iteration 2 — RAG-Enhanced Retail Assistance:**
Personalize recommendations with retailer history, promo calendars, market trends, and survey snippets via **RAG (Retrieval-Augmented Generation)**; surface linked evidence. "What-if" price bands scored for revenue and stockout risk.

**Iteration 3 — Autonomous Multi-Agent Autopilot:**
Watcher detects events → Simulator proposes actions (multi-objective) → Policy/Guard tags **AUTO / APPROVE / BLOCK** → Learner updates pricing; Actuator applies **low-risk** changes with canary + auto-rollback; **HITL (Human-in-the-Loop)** for high-risk moves; everything logged to an immutable audit trail.

![Capstone Poster – STOCKWISE](/images/posts/verifiable-agents/Stockwise%20agentic%20AI.png "Agentic pricing & promotion planning poster")

---

Big thanks to **Aishwarya Naresh Reganti** and **Kiriti Badam** for a course that prioritizes **evidence over hype** and turns agent design into an operational discipline. The **Chai & AI (tea-and-AI)** sessions, in particular, brought diverse voices, clarified buzzwords, and delivered patterns I could apply the next day. 