# dotfiles

公開可能な dotfiles を管理するリポジトリです。

## 方針

- 公開して問題ない設定のみをこのリポジトリで管理する
- [XDG Base Directory Specification](https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html) で表現できるものは、可能な限り XDG 準拠で配置する

## 構成

- `dot_*`, `dot_config/`, `Brewfile` — `chezmoi` が `$HOME` / `~/.config` に反映する公開設定
- `.chezmoiexternal.toml` — 外部リポジトリや配布物を `chezmoi` externals として同期する定義
- `scripts/bootstrap.sh` — 新しい macOS マシン向け初期セットアップ
- `docs/` — 補足メモ

## セットアップ

### 既存環境に反映する

```sh
chezmoi init --source ~/local/src/github.com/sgtakeru/dotfiles
chezmoi apply --source ~/local/src/github.com/sgtakeru/dotfiles
```

### 新しい macOS を初期化する

新しい端末では、`git clone` 前にそのまま実行できます。

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/sgtakeru/dotfiles/main/scripts/bootstrap.sh)"
```

> Homebrew の初回インストールで `sudo` が必要になるため、`curl ... | bash` ではなく TTY を保てるこの形を推奨します。

このスクリプトは Homebrew の導入、`dotfiles` の HTTPS clone、`chezmoi init --apply` による公開設定と externals の反映、公開 `Brewfile` の適用まで行います。

公開設定だけを更新したい場合は次のコマンドです。

```sh
chezmoi apply --source ~/local/src/github.com/sgtakeru/dotfiles
```

tmux plugin manager (`tpm`) `chezmoi` external として同期します。

`chezmoi` の普段使いのコマンドは [docs/chezmoi-cheatsheet.md](/Users/shigemori/local/src/github.com/sgtakeru/dotfiles/docs/chezmoi-cheatsheet.md) にまとめています。

> 詳しい運用ルールは `AGENTS.md` を参照してください。
