#!/usr/bin/env bash
set -euo pipefail
repo_root=$(cd "$(dirname "$0")/.." && pwd)
git -C "$repo_root" switch checkout-carry-start
git -C "$repo_root" reset --hard checkout-carry-start
git -C "$repo_root" clean -fd
cat > "$repo_root/checkout-carry-conflict.txt" <<'CONTENT'
conflict line local from working tree
conflict line shared
CONTENT
printf "Ready: checkout checkout-carry-conflict in git-chat-ui. Expected: stash apply --index conflicts, temp stash remains, conflict viewer opens.\n"
git -C "$repo_root" status --short --branch
