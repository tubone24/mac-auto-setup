# Mac Automation Environment Setup Tool

> Automation Env Setup tool for Mac

## 

## 使う前に

HomebrewとAnsibleを入れないと動かないのでそこまでは手動で入れます。

Install Homebrew

```
# Install X-code
$ xcode-select --install
 
# Install Homebrew
$ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
 
# Homebrew doctor: If error, Search by Google!
$ brew doctor
```

Install Ansible

```
# Install Ansible
$ brew install ansible
```

## 動かし方

```
# Macセットアップ
make setup TARGET=mac

# 正しくインストール出来ているかチェック
make before-check TARGET=mac
make check TARGET=mac
```

## 利用技術

### Ansible

サーバのプロビジョニング自動化ツール。SSHで使うイメージが強いが、local Execという機能もある。

MacのHomebrewにも対応している。

### Serverspec

Ruby製のサーバ設定情報チェックツール。

コマンドの出力結果やインストール状況を確認することができる。