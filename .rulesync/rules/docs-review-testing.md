---
targets: ['*']
description: 'Browser testing tips for documentation review'
---

# Documentation Review - Browser Testing

Tips for browser-testing AG Grid documentation pages via chrome automation.

## Page Navigation

-   AG Grid example grids are rendered inside iframes. Scrolling while the cursor is over a grid example scrolls the grid's rows, not the page itself.
-   To navigate down the page, scroll outside the grid area (e.g., over prose text or margins), or use keyboard navigation (`End`, `Home`, `Page Down`/`Page Up`).
-   Use anchor links (`#section-name`) in the URL to jump directly to specific sections rather than scrolling through the entire page.

## Example Testing

-   Each example has interactive controls (buttons, dropdowns) rendered above the grid iframe. Click them to verify the documented behaviour.
-   After clicking an interactive control, take a screenshot to capture the result state.
-   Check the browser console for errors after testing examples — expected messages like AG Grid Enterprise license warnings can be ignored.

## URL Pattern

-   Dev server docs pages require a framework prefix: `https://localhost:4610/javascript-data-grid/${pageName}/`
-   The framework prefix can be changed to test other frameworks: `react-data-grid`, `angular-data-grid`, `vue-data-grid`.
