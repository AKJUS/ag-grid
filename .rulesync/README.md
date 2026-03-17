# Agentic Tooling Crib-Sheet

Quick-reference for all AI agent commands, skills, sub-agents, and rules available in this repo.

## How It Works

| Folder       | Purpose                                                                                           | Loaded by              |
| ------------ | ------------------------------------------------------------------------------------------------- | ---------------------- |
| `.rulesync/` | Canonical shared source — works across tools (Cursor, Claude Code, etc.)                          | All supported AI tools |
| `.claude/`   | Claude Code extensions — mirrors `.rulesync/` plus Claude Code-specific agents, skills, and rules | Claude Code only       |

**Loading behaviour:**

-   **Rules** load automatically based on file-pattern globs (e.g. editing a `.test.ts` file loads the `testing` rule). The root rule (`ag-grid`) loads for all files.
-   **Skills** load on-demand when invoked via `/skill-name`. Skills marked **(user)** are user-invocable only — the LLM should not invoke them autonomously via the Skill tool.
-   **Sub-agents** are spawned automatically by the AI when a task matches their speciality.
-   **Commands** are invoked explicitly via `/command-name`.

**Provenance key:**

-   🟢 **Local** — ag-grid specific (normal file in `.rulesync/`)
-   🔵 **Shared** — reusable across AG products (symlink to `external/ag-shared/`)

---

## Everyday Development

| Type  | Name                  | Invoke                             | What it does                                       |
| ----- | --------------------- | ---------------------------------- | -------------------------------------------------- |
| Skill | 🔵 `code-fixup`       | `/code-fixup <package>` (user)     | Fix build and lint errors across a package         |
| Skill | 🔵 `code-cleanup`     | `/code-cleanup` (user)             | Remove bloat, duplication; improve clarity         |
| Skill | 🔵 `pr-create`        | `/pr-create` (user)                | Commit, push, and open a PR                        |
| Skill | 🔵 `pr-review`        | `/pr-review [--json] <PR#>` (user) | Review a PR (Markdown default, JSON with `--json`) |
| Skill | 🟢 `dev-server`       | `/dev-server`                      | Start dev server, check build status               |
| Skill | 🔵 `git-conventions`  | `/git-conventions`                 | Branch, commit, and PR naming conventions          |
| Skill | 🟢 `technology-stack` | `/technology-stack`                | Architecture constraints and zero-dependency rules |

## Testing and Quality

| Type    | Name                    | Invoke                       | What it does                                                    |
| ------- | ----------------------- | ---------------------------- | --------------------------------------------------------------- |
| Skill   | 🔵 `git-bisect`         | `/git-bisect` (user)         | Find the commit that introduced a regression                    |
| Skill   | 🔵 `batch-lint-cleanup` | `/batch-lint-cleanup` (user) | Auto-fix ESLint violations by rule                              |
| Command | 🟢 `/docs-e2e-tests`    | `/docs-e2e-tests`            | Write/update Playwright tests for doc examples                  |
| Command | 🟢 `/manual-test`       | `/manual-test <url>`         | Create a manual test project from a docs example or plunker URL |
| Agent   | 🔵 `playwright-expert`  | Auto                         | Playwright test architecture and debugging                      |

## Documentation and Examples

| Type  | Name               | Invoke           | What it does                                             |
| ----- | ------------------ | ---------------- | -------------------------------------------------------- |
| Skill | 🔵 `example`       | `/example`       | AG Charts/Grid/Studio example conventions and patterns   |
| Skill | 🔵 `website-astro` | `/website-astro` | Astro page patterns, content collections, and components |
| Skill | 🔵 `website-css`   | `/website-css`   | CSS architecture, design tokens, and styling patterns    |

## Planning and Analysis

| Type  | Name                            | Invoke                               | What it does                                               |
| ----- | ------------------------------- | ------------------------------------ | ---------------------------------------------------------- |
| Skill | 🔵 `jira`                       | `/jira`                              | Create, estimate, or analyse JIRA tickets                  |
| Skill | 🔵 `nx-performance`             | `/nx-performance`                    | Nx monorepo performance diagnostics and optimization       |
| Skill | 🔵 `plan-implementation-review` | `/plan-implementation-review` (user) | Review plan execution, identify delivery gaps              |
| Skill | 🔵 `plan-review`                | `/plan-review` (user)                | Review plans for completeness and correctness              |
| Agent | 🔵 `nx-expert`                  | Auto                                 | Nx monorepo configuration and build optimisation           |

## Prompt Hygiene

| Type  | Name                  | Invoke                     | What it does                                     |
| ----- | --------------------- | -------------------------- | ------------------------------------------------ |
| Skill | 🔵 `reflect`          | `/reflect` (user)          | Self-reflection and meta-cognitive analysis      |
| Skill | 🔵 `rulesync`         | `/rulesync`                | Configure AI/agentic tooling via `.rulesync/`    |
| Skill | 🔵 `validate-prompts` | `/validate-prompts` (user) | Validate prompt file references for path hygiene |

## Memory

| Type  | Name          | Invoke             | What it does                                       |
| ----- | ------------- | ------------------ | -------------------------------------------------- |
| Skill | 🔵 `remember` | `/remember` (user) | Save branch context or project learnings as memory |
| Skill | 🔵 `recall`   | `/recall` (user)   | Load branch context, browse project memories       |

## Documentation Review

| Type    | Name                      | Invoke                 | What it does                                                     |
| ------- | ------------------------- | ---------------------- | ---------------------------------------------------------------- |
| Command | 🟢 `/docs-review`         | `/docs-review`         | Review docs pages for technical accuracy and example consistency |
| Command | 🟢 `/release-docs-review` | `/release-docs-review` | Review all documentation changes between releases                |

## Git and Branch Management

| Type  | Name                    | Invoke                       | What it does                                 |
| ----- | ----------------------- | ---------------------------- | -------------------------------------------- |
| Skill | 🔵 `sync-ag-shared`     | `/sync-ag-shared` (user)     | Sync ag-shared subrepo across AG repos       |
| Skill | 🔵 `git-worktree-clean` | `/git-worktree-clean` (user) | Hard-reset worktree to `origin/latest`       |
| Skill | 🔵 `git-split`          | `/git-split` (user)          | Split large files preserving git history     |
| Skill | 🔵 `pr-split`           | `/pr-split` (user)           | Split a branch into stacked PRs              |
| Skill | 🔵 `ag-shared-sync-log` | `/ag-shared-sync-log` (user) | Generate migration log for ag-shared changes |

---

## Rules Reference

Rules load automatically when you edit files matching their glob patterns.

### Root Rule (always loaded)

| Rule         | Description                                           |
| ------------ | ----------------------------------------------------- |
| 🟢 `ag-grid` | Project overview, build chain, development guidelines |

### Core Code

| Rule              | Activates on             | Description                            |
| ----------------- | ------------------------ | -------------------------------------- |
| 🔵 `code-quality` | `packages/*/src/**/*.ts` | Bloat avoidance and comment guidelines |

### Testing and Benchmarks

| Rule            | Activates on                                   | Description                                         |
| --------------- | ---------------------------------------------- | --------------------------------------------------- |
| 🟢 `testing`    | `**/*.test.ts`, `**/*.spec.ts`, `testing/**/*` | Testing strategies, Jest patterns, and verification |
| 🟢 `benchmarks` | `testing/performance/**/*`, `**/benchmark*`    | Running and creating performance benchmarks         |

### Documentation and Examples

| Rule            | Activates on                                        | Description                                  |
| --------------- | --------------------------------------------------- | -------------------------------------------- |
| 🟢 `docs-pages` | `documentation/**/*.mdoc`, `documentation/**/*.md`  | Creating and maintaining documentation pages |
| 🟢 `examples`   | `_examples/**/*`, `documentation/**/_examples/**/*` | Working with examples in AG Grid             |

---

## Skills Reference

Skills load on-demand when invoked. All skills are invoked via `/skill-name`. All skills are shared across AI tools via `.rulesync/skills/`.

| Skill                           | Description                                                 |
| ------------------------------- | ----------------------------------------------------------- |
| 🔵 `ag-shared-sync-log`         | Generate migration log entries for ag-shared changes        |
| 🔵 `batch-lint-cleanup`         | Auto-fix ESLint violations by rule                          |
| 🔵 `code-cleanup`               | Remove bloat, duplication; improve clarity                  |
| 🔵 `code-fixup`                 | Fix build and lint errors across a package                  |
| 🟢 `dev-server`                 | Start dev server, check build status                        |
| 🔵 `example`                    | AG Charts/Grid/Studio example conventions and patterns      |
| 🔵 `git-bisect`                 | Find the commit that introduced a regression                |
| 🔵 `git-conventions`            | Branch, commit, and PR naming conventions                   |
| 🔵 `git-split`                  | Split large files preserving git history                    |
| 🔵 `git-worktree-clean`         | Hard-reset worktree to `origin/latest`                      |
| 🔵 `jira`                       | Create, estimate, or analyse JIRA tickets                   |
| 🔵 `nx-performance`             | Nx monorepo performance diagnostics and optimization        |
| 🔵 `plan-implementation-review` | Review plan execution, identify delivery gaps               |
| 🔵 `plan-review`                | Review plans for completeness and correctness               |
| 🔵 `pr-create`                  | Commit, push, and open a PR                                 |
| 🔵 `pr-review`                  | Review a PR (Markdown default, JSON with `--json`)          |
| 🔵 `pr-split`                   | Split a branch into stacked PRs                             |
| 🔵 `recall`                     | Load branch context, browse project memories                |
| 🔵 `reflect`                    | Self-reflection and meta-cognitive analysis                 |
| 🔵 `remember`                   | Save branch context or project learnings as memory          |
| 🔵 `rulesync`                   | Configure AI/agentic tooling via `.rulesync/`               |
| 🔵 `sync-ag-shared`             | Sync ag-shared subrepo changes across AG repos              |
| 🟢 `technology-stack`           | Architecture constraints and zero-dependency requirements   |
| 🔵 `validate-prompts`           | Validate prompt file references for consistency and hygiene |
| 🔵 `website-astro`              | Astro page patterns, content collections, and components    |
| 🔵 `website-css`                | CSS architecture, design tokens, and styling patterns       |

---

## Sub-Agents Reference

Sub-agents are spawned automatically when the AI determines a task matches their speciality. They cannot be invoked directly.

| Agent                  | Description                                      |
| ---------------------- | ------------------------------------------------ |
| 🔵 `nx-expert`         | Nx monorepo configuration and build optimisation |
| 🔵 `playwright-expert` | Playwright E2E test architecture and debugging   |
