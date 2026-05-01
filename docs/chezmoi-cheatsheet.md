# chezmoi Cheatsheet

`ghostty` を例に、普段使う `chezmoi` コマンドだけをまとめます。

このリポジトリを default source にしていない環境では、各コマンドに `--source ~/local/src/github.com/sgtakeru/dotfiles` を付けます。
`chezmoi list` が空の場合は、chezmoi がデフォルトの `~/.local/share/chezmoi` を見ています。

## 管理済みファイルを編集する

source を明示して編集します。

```sh
chezmoi --source ~/local/src/github.com/sgtakeru/dotfiles edit ~/.config/ghostty/config
chezmoi --source ~/local/src/github.com/sgtakeru/dotfiles diff
chezmoi --source ~/local/src/github.com/sgtakeru/dotfiles apply
```

`chezmoi edit` は管理対象の source file を開きます。
このリポジトリでは `~/.config/ghostty/config` は `dot_config/ghostty/config` に対応します。

`--source` を毎回付けたくない場合は、ローカルの chezmoi config に `sourceDir` を設定します。

```toml
# ~/.config/chezmoi/chezmoi.toml
sourceDir = "/Users/shigemori/local/src/github.com/sgtakeru/dotfiles"
```

## home 側を先に編集してしまった変更を取り込む

すでに `~/.config/ghostty/config` を直接編集した場合は、`chezmoi add` で source 側に取り込みます。

```sh
$EDITOR ~/.config/ghostty/config
chezmoi --source ~/local/src/github.com/sgtakeru/dotfiles add ~/.config/ghostty/config
chezmoi --source ~/local/src/github.com/sgtakeru/dotfiles diff
chezmoi --source ~/local/src/github.com/sgtakeru/dotfiles apply
```

`chezmoi add` は未管理ファイルの追加だけでなく、管理済みファイルの source 更新にも使えます。

## source 側の実ファイルパスを調べる

```sh
chezmoi --source ~/local/src/github.com/sgtakeru/dotfiles source-path ~/.config/ghostty/config
```

エディタで直接開きたい場合:

```sh
$EDITOR "$(chezmoi --source ~/local/src/github.com/sgtakeru/dotfiles source-path ~/.config/ghostty/config)"
```

## 外部リポジトリを更新する

`ghostty` の shader は `.chezmoiexternal.toml` で管理しています。

通常更新:

```sh
chezmoi --source ~/local/src/github.com/sgtakeru/dotfiles apply
```

externals を強制 refresh:

```sh
chezmoi --source ~/local/src/github.com/sgtakeru/dotfiles -R apply
```

## 差分と状態を見る

```sh
chezmoi --source ~/local/src/github.com/sgtakeru/dotfiles diff
chezmoi --source ~/local/src/github.com/sgtakeru/dotfiles status
```

## よくある使い分け

- 普段の編集: `chezmoi --source ~/local/src/github.com/sgtakeru/dotfiles edit ~/.config/ghostty/config`
- home 側変更の取り込み: `chezmoi --source ~/local/src/github.com/sgtakeru/dotfiles add ~/.config/ghostty/config`
- 反映前確認: `chezmoi --source ~/local/src/github.com/sgtakeru/dotfiles diff`
- 実反映: `chezmoi --source ~/local/src/github.com/sgtakeru/dotfiles apply`
- external の強制更新: `chezmoi --source ~/local/src/github.com/sgtakeru/dotfiles -R apply`
