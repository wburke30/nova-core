NOVA BUILD STEP 11 — FRONTEND SHELL (MANDATORY)

--------------------------------
ENVIRONMENT CHECK (MANDATORY)
--------------------------------

Before executing this step, you MUST:

1. Verify required dependencies exist
2. Install missing dependencies if needed
3. Verify required services are running
4. Start services if not running

You MUST NOT assume any dependency exists.

--------------------------------
REQUIRED CHECKS
--------------------------------

- Python installed and working
- Node.js installed and working
- PostgreSQL installed OR container running
- Backend server (if required for step)
- Frontend dev server (if required for step)

--------------------------------
FAIL RULE
--------------------------------

IF ANY dependency is missing or service is not running:

→ INSTALL or START it  
→ VERIFY it works  
→ THEN proceed  

DO NOT CONTINUE UNTIL VERIFIED

--------------------------------
GOAL
--------------------------------

Build the NOVA UI foundation using:

- Next.js (App Router)
- TailwindCSS
- component-based layout

UI MUST:

- follow UI_CONTRACT.md EXACTLY
- be responsive
- look modern (NOT bootstrap)
- be clean and minimal

---

--------------------------------
NON-NEGOTIABLE RULES
--------------------------------

- MUST follow UI_CONTRACT.md exactly
- MUST follow THEME_SYSTEM.md
- NO bootstrap
- NO generic admin templates
- NO cluttered UI

IF ANY ERROR:
→ FIX
→ RETRY

---

--------------------------------
STEP 1 — FRONTEND STACK
--------------------------------

Use:

- Next.js (latest)
- TypeScript
- TailwindCSS
- shadcn/ui components

---

--------------------------------
STEP 2 — GLOBAL LAYOUT
--------------------------------

Create:

/frontend/app/layout.tsx

MUST implement:

```
[ Sidebar ] [ Main Content ]
```

---

--------------------------------
STEP 3 — SIDEBAR (MANDATORY)
--------------------------------

Create sidebar with EXACT order:

1. Chat
2. Projects
3. Tasks
4. Workflows
5. Approvals
6. Integrations
7. Analytics
8. Settings

---

--------------------------------
STEP 4 — SIDEBAR RULES
--------------------------------

Sidebar MUST:

- fixed left
- ~240px width
- full height
- icons + labels
- highlight active item

---

--------------------------------
STEP 5 — CHAT VIEW (PRIMARY)
--------------------------------

Create:

/frontend/app/chat/page.tsx

MUST:

- be default route
- render chat interface
- include input at bottom

---

--------------------------------
STEP 6 — CHAT LAYOUT
--------------------------------

Chat MUST include:

- message list
- streaming area
- input box fixed bottom

---

--------------------------------
STEP 7 — MAIN CONTENT AREA
--------------------------------

MUST:

- adapt to selected nav item
- not reload entire page
- support dynamic rendering

---

--------------------------------
STEP 8 — ROUTING
--------------------------------

Implement routes:

/chat
/projects
/tasks
/workflows
/approvals
/integrations
/analytics
/settings

---

--------------------------------
STEP 9 — RESPONSIVE DESIGN
--------------------------------

MUST support:

DESKTOP:
- sidebar visible

TABLET:
- collapsible sidebar

MOBILE:
- drawer sidebar
- full-width chat

---

--------------------------------
STEP 10 — THEME SYSTEM
--------------------------------

MUST implement:

- system
- dark
- light

NO layout changes per theme

---

--------------------------------
STEP 11 — STYLING RULES
--------------------------------

UI MUST:

- use spacing consistently
- avoid clutter
- maintain readability
- use modern typography

---

--------------------------------
STEP 12 — FORBIDDEN UI BEHAVIOR
--------------------------------

DO NOT:

- use bootstrap
- use generic dashboards
- expose backend internals
- overcrowd interface

---

--------------------------------
STEP 13 — TEST UI
--------------------------------

Verify:

- layout renders correctly
- sidebar works
- navigation works
- responsive behavior works

---

--------------------------------
VALIDATION (MANDATORY)
--------------------------------

ALL MUST PASS:

- UI matches contract
- Chat is default view
- layout correct
- responsive works
- theme switching works

---

--------------------------------
FAIL CONDITIONS
--------------------------------

FAIL IF:

- UI looks generic/templated
- navigation incorrect
- layout breaks on mobile
- theme breaks layout

IF FAIL:
→ FIX
→ RETRY

---

--------------------------------
COMPLETION CRITERIA
--------------------------------

COMPLETE ONLY IF:

- UI matches UI_CONTRACT.md
- responsive works
- layout clean and modern

---

--------------------------------
STATE UPDATE
--------------------------------

11_FRONTEND_SHELL: complete

---

--------------------------------
NEXT STEP
--------------------------------

Proceed to:

12_FRONTEND_REALTIME.md