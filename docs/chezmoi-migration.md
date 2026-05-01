# chezmoi 導入まとめ

このリポジトリは `c1ab826 chezmoi 管理に移行` で `chezmoi` 前提の構成に移行しました。

## 目的

- 公開可能な dotfiles をこのリポジトリで一元管理する
- `~/.config` に置ける設定は XDG Base Directory に寄せる
- 新しい macOS でも bootstrap から同じ公開設定を再現できるようにする
- 秘密情報やホスト固有設定はこのリポジトリに含めず、必要なら `../secure-dotfiles` 側で扱う

## 変更内容

### chezmoi の source 形式へ移行

既存の dotfiles を `chezmoi` の source state に合わせて配置し直しました。

- `bashrc` -> `dot_bashrc`
- `gemrc` -> `dot_gemrc`
- `zshenv` -> `dot_zshenv`
- zsh 関連の分割ファイル -> `dot_zshrc`
- `gitconfig` -> `dot_config/git/config`
- `gitignore_global` -> `dot_config/git/ignore`
- `gitmessage` -> `dot_config/git/message`
- `irbrc` -> `dot_config/irb/irbrc`
- `tigrc` -> `dot_config/tig/config`
- `tmux.conf` -> `dot_config/tmux/tmux.conf`

あわせて、`ghostty`, `gh`, `direnv`, `mise`, `sheldon`, `starship`, `yazi` などの設定を `dot_config/` 配下に追加しました。

### externals を追加

`.chezmoiexternal.toml` で、直接リポジトリに取り込まない外部配布物を管理します。

- `~/.config/tmux/plugins/tpm`: tmux plugin manager
- `~/.config/nvim`: LazyVim starter

通常の反映は `chezmoi apply` で行い、externals を強制更新したい場合は `chezmoi -R apply` を使います。

### chezmoi の管理対象外を明示

`.chezmoiignore` で、リポジトリ運用やドキュメント用のファイルを home 側へ反映しないようにしました。

- `AGENTS.md`
- `README.md`
- `docs/**`
- `scripts/**`
- `config/**`
- `home/**`
- `cornix-layout.vil`
- `**/.DS_Store`

### bootstrap を chezmoi 前提に更新

`scripts/bootstrap.sh` は新しい macOS 向けに次の流れを実行します。

1. XDG Base Directory 用のディレクトリを作る
2. Homebrew がなければインストールする
3. `git`, `jq`, `chezmoi` を Homebrew でインストールする
4. `~/local/src/github.com/sgtakeru/dotfiles` にこのリポジトリを clone する
5. `chezmoi init --apply --source="$DOTFILES_DIR"` で公開設定を反映する
6. `$HOME/Brewfile` に反映された `Brewfile` を `brew bundle` で適用する

## 運用

既存環境で source を指定して初期化、反映する場合:

```sh
chezmoi init --source ~/local/src/github.com/sgtakeru/dotfiles
chezmoi apply --source ~/local/src/github.com/sgtakeru/dotfiles
```

`--source` はコマンドごとの global flag です。
このリポジトリを default source にしていない環境では、`chezmoi list`, `chezmoi edit`, `chezmoi diff`, `chezmoi apply` などにも `--source ~/local/src/github.com/sgtakeru/dotfiles` を付けます。

`chezmoi list` が空の場合は、chezmoi がデフォルトの `~/.local/share/chezmoi` を見ています。
`--source` を毎回付けたくない場合は、ローカルの chezmoi config に `sourceDir` を設定します。

```toml
# ~/.config/chezmoi/chezmoi.toml
sourceDir = "/Users/shigemori/local/src/github.com/sgtakeru/dotfiles"
```

普段の編集:

```sh
chezmoi --source ~/local/src/github.com/sgtakeru/dotfiles edit ~/.config/ghostty/config
chezmoi --source ~/local/src/github.com/sgtakeru/dotfiles diff
chezmoi --source ~/local/src/github.com/sgtakeru/dotfiles apply
```

home 側を先に編集した変更を source 側へ取り込む場合:

```sh
chezmoi --source ~/local/src/github.com/sgtakeru/dotfiles add ~/.config/ghostty/config
chezmoi --source ~/local/src/github.com/sgtakeru/dotfiles diff
chezmoi --source ~/local/src/github.com/sgtakeru/dotfiles apply
```

詳しいコマンドの使い分けは [chezmoi Cheatsheet](./chezmoi-cheatsheet.md) を参照してください。

## 注意点

- トークン、秘密鍵、認証情報、ホスト固有設定はこのリポジトリに入れない
- XDG で表現できる設定は `dot_config/` 配下に置く
- bootstrap の挙動を変えたら `README.md` も更新する
- macOS 前提の bootstrap なので、他 OS 向けの変更は明示的にガードする
