# NOVA — UI CONTRACT (Authoritative)

## PURPOSE

Defines the mandatory UI and UX rules for NOVA.

Ensures:

- premium modern appearance
- simple non-confusing experience
- responsive behavior
- zero visual drift during implementation

---

## CORE RULE

The UI MUST follow this contract exactly.

If implementation deviates from this file, the UI is incorrect.

---

## PRIMARY UX PRINCIPLE

NOVA is a chat-first, real-time operating system.

The interface MUST feel:

- modern
- responsive
- calm
- premium
- simple

It MUST NOT feel:

- cluttered
- template-driven
- bootstrap-like
- like a generic admin panel

---

## GLOBAL LAYOUT

Desktop layout MUST be:

```text
[ Sidebar ] [ Main Content ]
```

Optional advanced layout:

```text
[ Sidebar ] [ Main Content ] [ Context Panel ]
```

The Context Panel is optional and secondary.
Chat remains the primary focus.

---

## PRIMARY NAVIGATION (FIXED ORDER)

Sidebar order is NON-NEGOTIABLE:

1. Chat
2. Projects
3. Tasks
4. Workflows
5. Approvals
6. Integrations
7. Analytics
8. Settings

This order MUST NOT change dynamically.

---

## SIDEBAR RULES

Sidebar MUST:

- be fixed on desktop
- be approximately 240px wide
- span full viewport height
- use icons + labels
- clearly indicate active route
- remain visually minimal

Sidebar MUST NOT:

- contain excessive nesting
- expose internal architecture terms
- become visually crowded

---

## DEFAULT VIEW

The default route and default visible experience MUST be:

```text
Chat
```

Users must land in Chat first.

---

## CHAT VIEW RULES

Chat is the hero interface.

Chat MUST include:

- conversation history
- input area fixed at bottom of main panel
- streaming/live response area
- clear system activity feedback
- real-time updates without refresh

Chat MUST NOT:

- require page refresh
- flicker
- re-render the whole screen on each update

---

## MAIN CONTENT RULES

Main content area MUST:

- update without full page reload
- render the active route clearly
- preserve layout consistency across sections

---

## REAL-TIME UI RULES

The interface MUST be push-based.

Live state changes MUST come from WebSocket events.

Polling for live state is forbidden.

This includes:

- task updates
- pipeline stage updates
- approvals
- notifications
- node status
- integration status

---

## RESPONSIVE RULES

### Desktop
- sidebar visible and fixed
- chat/main panel visible immediately
- optional context panel may appear

### Tablet
- sidebar collapsible
- main panel expands
- no broken layouts

### Mobile
- sidebar becomes drawer
- main content full width
- chat remains primary
- no horizontal scrolling

---

## THEME RULES

The UI MUST support:

- system
- dark
- light

Theme changes MUST:

- apply instantly
- not reload page
- not change layout structure
- not break spacing or readability

---

## DESIGN RULES

UI MUST use:

- consistent spacing
- modern typography
- strong contrast
- clean component hierarchy
- subtle motion only where useful

Recommended implementation style:

- Next.js
- TailwindCSS
- shadcn/ui
- component-based composition

---

## VISUAL QUALITY RULES

The UI MUST feel comparable in quality to:

- Linear
- Vercel dashboard
- Stripe dashboard
- modern Notion-style interfaces

The UI MUST NOT resemble:

- Bootstrap admin templates
- generic CRUD dashboards
- low-effort component dumps

---

## COMPONENT REQUIREMENTS

At minimum, the UI system MUST include:

### Navigation
- Sidebar
- Mobile drawer
- Active route state

### Chat
- Message list
- Input composer
- Streaming response renderer

### Tasks
- Task list
- Status badges
- Live updates

### Approvals
- Pending approvals list
- Approval action controls

### Integrations
- Connected integrations list
- Health/status indicators

### Settings
- Theme selector
- Users & Teams
- Storage
- Roles
- Automation

---

## CONNECTION STATE UX

The UI MUST visibly support:

- connecting
- connected
- reconnecting
- disconnected

Users must always understand whether real-time connection is active.

---

## EMPTY STATE RULES

Every page MUST handle empty state gracefully.

Examples:

- no tasks yet
- no integrations connected
- no approvals pending

Empty states MUST be clear and calm, not broken-looking.

---

## ERROR STATE RULES

Errors MUST:

- be visible
- be understandable
- not expose internal stack traces
- not break the page layout

---

## ACCESSIBILITY RULES

UI MUST:

- support keyboard navigation
- maintain readable contrast
- be usable on desktop, tablet, and mobile
- avoid tiny click targets

---

## FORBIDDEN UI BEHAVIOR

You MUST NOT:

- use Bootstrap
- use generic admin templates
- expose internal system components in nav
- rely on polling for live state
- require refresh to see updates
- use cluttered layouts
- overload the user with controls

---

## VALIDATION RULE

The UI passes only if:

- nav order is exact
- Chat is default
- responsive layouts work
- real-time updates work
- theme switching works
- interface feels modern and uncluttered

---

## FINAL RULE

NOVA’s UI must communicate quiet power.

If it looks cheap, cluttered, or fake-real-time, it fails.