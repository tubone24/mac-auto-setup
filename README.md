# Mac Automation Environment Setup Tool


[![standard-readme compliant](https://img.shields.io/badge/readme%20style-standard-brightgreen.svg?style=flat-square)](https://github.com/RichardLitt/standard-readme)

> Automation Env Setup tool for Mac

Automation Environment setup tool for Mac using by Ansible provisioning and Serverspec checks.

## Table of Contents


## Background

One day, every time I replaced my PC, I was getting tired of building my own familiar and useful PC environment.

So that, I created an automatic environment setup tool for Mac with Ansible.


## Install

### System Requirements

- XCode
- Homebrew
- Ansible
- Ruby `v2.4.0 and more`

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