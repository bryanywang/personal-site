#!/bin/bash
# setup.sh — one-time setup: initializes git, connects to GitHub, and triggers first deploy
# Run this once from the folder containing your site files.
#
# BEFORE RUNNING:
#   1. Create a free account at https://github.com
#   2. Create a new empty repo at https://github.com/new
#      - Name it: personal-site  (or anything you like)
#      - Keep it private if you prefer
#      - Do NOT add a README or .gitignore — keep it empty
#   3. Copy the repo URL (looks like: https://github.com/YOUR_USERNAME/personal-site.git)
#   4. Paste it when this script asks for it
#
# AFTER RUNNING:
#   1. Go to https://vercel.com → sign up with GitHub (one click)
#   2. Click "Add New Project" → import your repo
#   3. Hit Deploy — no config needed, Vercel detects a static site automatically
#   4. (Optional) Add a custom domain under Settings → Domains

set -e

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "  Bryan Wang — Personal Site Setup"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

# ── Check git is installed ───────────────────────────────────────────────────
if ! command -v git &> /dev/null; then
  echo "✗ Git is not installed."
  echo "  Install it from https://git-scm.com/downloads then re-run this script."
  exit 1
fi

echo "✓ Git found: $(git --version)"
echo ""

# ── Get GitHub repo URL ──────────────────────────────────────────────────────
read -p "▸ Paste your GitHub repo URL (e.g. https://github.com/username/personal-site.git): " REPO_URL

if [ -z "$REPO_URL" ]; then
  echo "✗ No URL entered. Exiting."
  exit 1
fi

# ── Configure git identity if not already set ────────────────────────────────
GIT_NAME=$(git config --global user.name 2>/dev/null || echo "")
GIT_EMAIL=$(git config --global user.email 2>/dev/null || echo "")

if [ -z "$GIT_NAME" ]; then
  read -p "▸ Your name for git commits (e.g. Bryan Wang): " GIT_NAME
  git config --global user.name "$GIT_NAME"
fi

if [ -z "$GIT_EMAIL" ]; then
  read -p "▸ Your email for git commits: " GIT_EMAIL
  git config --global user.email "$GIT_EMAIL"
fi

echo ""
echo "▸ Initializing git repo..."
git init

echo "▸ Writing .gitignore..."
cat > .gitignore << 'EOF'
.DS_Store
Thumbs.db
*.log
.env
EOF

echo "▸ Staging all files..."
git add .

echo "▸ Creating initial commit..."
git commit -m "Initial commit — bryanwang.co"

echo "▸ Setting main branch..."
git branch -M main

echo "▸ Connecting to GitHub..."
git remote add origin "$REPO_URL"

echo "▸ Pushing to GitHub..."
git push -u origin main

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "  ✓ Code is live on GitHub!"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "  Next steps (takes ~5 minutes):"
echo ""
echo "  1. Go to https://vercel.com"
echo "     → Sign up / log in with GitHub"
echo "     → Click 'Add New Project'"
echo "     → Select your repo: personal-site"
echo "     → Click Deploy  (no config needed)"
echo ""
echo "  2. Your site will be live at:"
echo "     https://personal-site-xxxx.vercel.app"
echo ""
echo "  3. To add a custom domain (optional):"
echo "     → Buy a domain at https://namecheap.com"
echo "     → In Vercel: Settings → Domains → Add domain"
echo "     → Paste in the DNS records Vercel gives you"
echo ""
echo "  Future deploys: just run ./deploy.sh \"your message\""
echo ""

# Make deploy.sh executable for future use
chmod +x deploy.sh 2>/dev/null || true
