# NOVA — Theme System (Authoritative)

## PURPOSE

Defines how NOVA handles visual themes across the entire UI.

Ensures:

- consistent appearance
- user control
- accessibility
- zero layout breakage

---

## CORE RULE

Theme MUST affect appearance ONLY.

Theme MUST NOT affect:

- layout
- spacing
- component structure
- behavior

---

## SUPPORTED THEMES

The system MUST support EXACTLY:

- system (default)
- dark
- light

---

## DEFAULT BEHAVIOR

Default theme MUST be:

```text
system
```

---

## SYSTEM MODE

When theme = system:

- follow OS/browser preference
- use `prefers-color-scheme`
- update automatically when OS changes

---

## STORAGE REQUIREMENTS

Theme MUST persist across sessions.

Store:

- localStorage (frontend)
- optional backend user setting

---

## IMPLEMENTATION REQUIREMENTS

Frontend MUST use:

- TailwindCSS with class-based dark mode

Example:

```html
<html class="dark">
```

---

## ROOT CONTROL

Theme MUST be applied at root level:

- `<html>` or `<body>` element
- not per component

---

## THEME SWITCHING

User MUST be able to change theme via:

```
Settings → Theme
```

Options:

- System
- Dark
- Light

---

## SWITCHING BEHAVIOR

Theme change MUST:

- apply instantly
- NOT reload page
- NOT flicker
- NOT reset state

---

## COLOR RULES

---

### Dark Theme

- background: dark slate / near-black
- text: light
- contrast must be high

---

### Light Theme

- background: white or light gray
- text: dark
- maintain readability

---

## COMPONENT RULE

ALL UI components MUST support both themes:

- sidebar
- chat
- cards
- inputs
- buttons
- modals

---

## CONSISTENCY RULE

Theme MUST be consistent across:

- all pages
- all components
- all states

---

## RESPONSIVE RULE

Theme MUST work on:

- desktop
- tablet
- mobile

---

## ACCESSIBILITY RULE

Theme MUST:

- maintain readable contrast
- avoid low-contrast text
- support accessibility standards

---

## FORBIDDEN BEHAVIOR

You MUST NOT:

- change layout based on theme
- break UI in dark/light mode
- use hardcoded colors without theme support
- create inconsistent styles across pages

---

## VALIDATION RULE

Theme system passes only if:

- switching works instantly
- persists across reloads
- UI looks correct in all modes
- no layout shifts occur

---

## FINAL RULE

Theme enhances experience.

If theme breaks UI or readability → system fails.