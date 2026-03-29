#!/usr/bin/env bash
set -euo pipefail

echo "== XDG Base Directory Setup =="
mkdir -p "$HOME/.config"
mkdir -p "$HOME/.local/share"
mkdir -p "$HOME/.local/state"
mkdir -p "$HOME/.cache"

GHQ_ROOT="$HOME/local/src"
DOTFILES_DIR="$GHQ_ROOT/github.com/sgtakeru/dotfiles"

echo "== Install Homebrew =="
if ! command -v brew >/dev/null 2>&1; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

echo "== Install minimum tools =="
brew install git jq chezmoi

mkdir -p "$(dirname "$DOTFILES_DIR")"
if [ ! -d "$DOTFILES_DIR/.git" ]; then
  git clone https://github.com/sgtakeru/dotfiles.git "$DOTFILES_DIR"
fi

echo "== Apply public dotfiles with chezmoi =="
chezmoi init --apply --source="$DOTFILES_DIR"

echo "== Run Brewfile =="
brew bundle --file="$HOME/Brewfile"

echo "== Done =="
