# QuizAppWithCursor - iOS (AI Agent-Driven Development via Cursor)

An advanced iOS application engineered utilizing modern **AI-Driven Development (AIDD)** workflows via the **Cursor AI Agent (Composer)** ecosystem. Rather than treating AI as a simple autocomplete utility, this project showcases autonomous developer-agent collaboration—leveraging cognitive agents to perform codebase scanning, iterative multi-file refactoring, dynamic animation insertion, and automated root-cause debugging loops.

## 🤖 AI Agent Workflows & Engineering Paradigms

This repository highlights a shifting paradigm in software engineering where the human developer acts as an architectural supervisor guiding an autonomous AI Agent:

*   **Autonomous Codebase Exploration:** Deployed the Cursor Agent to actively explore, index, and analyze 18+ framework files simultaneously to maintain structural context across models, view-models, and views.
*   **Agent-Guided Root Cause Analysis (RCA):** Resolved a systemic application lifecycle crash triggered during runtime termination events. The agent traced memory execution paths down to the specialized utility layer (`AppCloser.swift`), identifying instability in background thread suspension routines (`NSXPCConnection`), and successfully deployed safe dispatch delays (`DispatchQueue.main.asyncAfter`).
*   **Iterative Design Refactoring:** Leveraged semantic prompting to abstract structural styling tokens into unified themes (`Theme` catalog) while prompting the agent to dynamically inject fluid, state-driven step animations across decoupled SwiftUI modules (`QuizView`, `ResultView`, `WelcomeView`).
*   **Code Modernization & Optimization:** Continuous feedback loops with the composer agent guided the refinement of the codebase—enforcing clean separations, minimizing boilerplate overhead, and maximizing readability and maintainability.

## 🛠️ Tech Stack & Concepts Covered

*   Language: **Swift**
*   UI Framework: **SwiftUI (Declarative Layouts & Native Step Animations)**
*   Architecture: **MVVM (Model-View-ViewModel)**
*   Methodology: **AI-Driven Development (AIDD)**, **Autonomous Agent Diagnostics (Cursor Composer)**
*   Engineering Standards: **SOLID Principles**, **Loose Component Coupling**, **Asynchronous Main Thread Safety**
