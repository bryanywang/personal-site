#!/bin/bash
# deploy.sh — stage, commit, and push all changes to GitHub
# Usage: ./deploy.sh "your commit message"
# Example: ./deploy.sh "Add poem: Midnight Sun"

set -e

MSG=${1:-"Update site"}

echo ""
echo "▸ Staging all changes..."
git add .

echo "▸ Committing: \"$MSG\""
git commit -m "$MSG"

echo "▸ Pushing to GitHub..."
git push

echo ""
echo "✓ Done. Vercel will redeploy in ~15 seconds."
echo "  Check progress at: https://vercel.com/dashboard"
echo ""
