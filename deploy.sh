#!/usr/bin/env bash
set -euo pipefail

REMOTE="bsm23@tux.cs.drexel.edu"
REMOTE_PATH="public_html/"

usage() {
  echo "Usage: $0 <command>"
  echo ""
  echo "Commands:"
  echo "  build    Build the site into build/"
  echo "  verify   Serve the build locally for review (http://localhost:4173)"
  echo "  deploy   Push the full build/ to the server"
  echo "  data     Push only static/ deltas (JSON, PDFs, syllabi) — no rebuild needed"
  exit 1
}

[[ $# -lt 1 ]] && usage

case "$1" in
  build)
    echo "==> Building..."
    pnpm build
    echo "==> Done. Run './deploy.sh verify' to preview or './deploy.sh deploy' to push."
    ;;

  verify)
    echo "==> Starting local preview at http://localhost:4173/~bmitchell/ ..."
    pnpm preview
    ;;

  deploy)
    echo "==> Deploying build/ to ${REMOTE}:${REMOTE_PATH}..."
    rsync -avz --delete --exclude='.DS_Store' build/ "${REMOTE}:${REMOTE_PATH}"
    echo "==> Fixing permissions..."
    ssh "${REMOTE}" "find ~/public_html -type f -exec chmod 644 {} + && find ~/public_html -type d -exec chmod 755 {} +"
    echo "==> Done."
    ;;

  data)
    echo "==> Syncing static/ deltas to ${REMOTE}:${REMOTE_PATH}..."
    rsync -avz --exclude='.DS_Store' static/ "${REMOTE}:${REMOTE_PATH}"
    echo "==> Fixing permissions..."
    ssh "${REMOTE}" "find ~/public_html -type f -exec chmod 644 {} + && find ~/public_html -type d -exec chmod 755 {} +"
    echo "==> Done."
    ;;

  *)
    usage
    ;;
esac
