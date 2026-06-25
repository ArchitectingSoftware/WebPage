#!/usr/bin/env bash
set -euo pipefail

REMOTE="bsm23@tux.cs.drexel.edu"
REMOTE_PATH="public_html/"

DATA_FILES=(
  static/contact.json
  static/courses.json
  static/publications.json
  static/talks.json
)

if [[ "${1:-}" == "data" ]]; then
  echo "==> Syncing data files only (no rebuild)..."
  rsync -avz "${DATA_FILES[@]}" "${REMOTE}:${REMOTE_PATH}"
  echo "==> Done."
  exit 0
fi

echo "==> Building..."
pnpm build

echo "==> Deploying to ${REMOTE}:${REMOTE_PATH}..."
rsync -avz --delete build/ "${REMOTE}:${REMOTE_PATH}"
echo "==> Done."
