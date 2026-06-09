#!/usr/bin/env bash
set -euo pipefail
repo_root=$(cd "$(dirname "$0")/.." && pwd)
git -C "$repo_root" reset --hard
git -C "$repo_root" clean -fd
git -C "$repo_root" switch checkout-carry-start
git -C "$repo_root" reset --hard checkout-carry-start
git -C "$repo_root" clean -fd
cat > "$repo_root/checkout-carry-success.txt" <<'CONTENT'
success line 1 base
success line 2 shared
success line 3 local from working tree
CONTENT
cat > "$repo_root/checkout-carry-index.txt" <<'CONTENT'
index baseline
staged local change carried with --index
CONTENT
git -C "$repo_root" add checkout-carry-index.txt
cat > "$repo_root/checkout-carry-untracked.txt" <<'CONTENT'
untracked local change carried by --include-untracked
CONTENT
printf "Ready: checkout checkout-carry-success in git-chat-ui. Expected: stash apply --index succeeds, temp stash is dropped.\n"
git -C "$repo_root" status --short --branch
