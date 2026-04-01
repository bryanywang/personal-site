# bryanwang.ooo

Personal website for Bryan Wang — operator, investor, occasional poet, obsessed Beli power user.

Built with plain HTML and CSS. No frameworks, no build step, no dependencies.

**Live site:** [bryanwang.co](https://bryanwang.ooo/)

---

## Structure

```
/
├── index.html                  # Landing page
├── portfolio.html              # Investment portfolio (OAS Capital)
├── projects.html               # Work history
├── poetry.html                 # Poetry index
├── poems/
│   ├── imagine.html
│   ├── verbs.html
│   ├── cry.html
│   ├── the-bitter-that-follows.html
│   └── midnight-sun.html
├── deploy.sh                   # One-command deploy script
└── README.md
```

---

## Adding a Poem

1. Duplicate any file in `poems/`
2. Update the `<title>` tag and `<h1 class="poem-title">` with your poem's name
3. Find the two `═══` comment lines in the file and replace everything between them with your stanzas — each stanza in its own `<p>` tag, line breaks with `<br>`, italics with `<em>`
4. Delete the `.edit-note` block
5. Update `poetry.html` to add a new `<li>` linking to your file
6. Run `./deploy.sh "Add poem: Your Title"` to push live

---

## Deploying Changes

Any edit — poem, copy change, new company — goes live with one command:

```bash
./deploy.sh "your commit message"
```

This stages all changes, commits with your message, and pushes to GitHub. Vercel picks it up automatically and redeploys in ~15 seconds.

---

## Tech

- Pure HTML/CSS — no React, no bundler, no Node
- Hosted on [Vercel](https://vercel.com) (free tier)
- Dark mode via `localStorage` + `data-theme` attribute on `<html>`
- Fonts: Helvetica Neue (system)
- Responsive down to mobile via CSS media queries

---

## Local Preview

No server needed for most things — just open `index.html` in your browser.

If you want proper link navigation between pages locally:

```bash
# Python (usually pre-installed)
python3 -m http.server 3000
# then open http://localhost:3000
```

---

*© 2026 Bryan Wang*
