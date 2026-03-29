# chezmoi Cheatsheet

`ghostty` を例に、普段使う `chezmoi` コマンドだけをまとめます。

## 管理済みファイルを編集する

通常は source 側を直接編集します。

```sh
chezmoi edit ~/.config/ghostty/config
chezmoi diff
chezmoi apply
```

`chezmoi edit` は管理対象の source file を開きます。
このリポジトリでは `~/.config/ghostty/config` は `dot_config/ghostty/config` に対応します。

## home 側を先に編集してしまった変更を取り込む

すでに `~/.config/ghostty/config` を直接編集した場合は、`chezmoi add` で source 側に取り込みます。

```sh
$EDITOR ~/.config/ghostty/config
chezmoi add ~/.config/ghostty/config
chezmoi diff
chezmoi apply
```

`chezmoi add` は未管理ファイルの追加だけでなく、管理済みファイルの source 更新にも使えます。

## source 側の実ファイルパスを調べる

```sh
chezmoi source-path ~/.config/ghostty/config
```

エディタで直接開きたい場合:

```sh
$EDITOR "$(chezmoi source-path ~/.config/ghostty/config)"
```

## 外部リポジトリを更新する

`ghostty` の shader は `.chezmoiexternal.toml` で管理しています。

通常更新:

```sh
chezmoi apply
```

externals を強制 refresh:

```sh
chezmoi -R apply
```

## 差分と状態を見る

```sh
chezmoi diff
chezmoi status
```

## よくある使い分け

- 普段の編集: `chezmoi edit ~/.config/ghostty/config`
- home 側変更の取り込み: `chezmoi add ~/.config/ghostty/config`
- 反映前確認: `chezmoi diff`
- 実反映: `chezmoi apply`
- external の強制更新: `chezmoi -R apply`
