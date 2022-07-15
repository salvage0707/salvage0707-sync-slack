# README

## 概要

Rails7を使った開発用テンプレート

## 環境

|ツール| バージョン| 説明|
|---|---|---|
|Ruby on Rails | 7系| フレームワーク|
|Postgresql| 12系| DB|
|yarn | -| jsのパッケージ管理|

## インストールされているもの
| | 説明| 参考|
|---|---|---|
|Rspec| テストツール| https://github.com/rspec/rspec-rails|
|factory_bot| テストデータツール|https://github.com/thoughtbot/factory_bot_rails|
|annotate| スキーマを要約したコメントをモデルに追加する| https://github.com/ctran/annotate_models|
|active_hash| ハッシュをActiveRecordみたいに扱える| https://github.com/active-hash/active_hash|
|active_type| modelの処理分割| https://github.com/makandra/active_type|
|rubocop| コードのリンター| https://github.com/rubocop/rubocop-rails <br> https://docs.rubocop.org/rubocop-rails/index.html <br> https://docs.rubocop.org/rubocop/compatibility.html|
|brakeman| コードのセキュリティチェック| https://github.com/presidentbeef/brakeman|

## setup

#### envファイル作成

プロジェクトルートで実行
```shell
$ sh scripts/setup.sh
```

#### データベース作成

```shell
$ docker compose run web rails db:create db:migrate
```

#### 起動確認

1. 起動する
```shell
 $ docker-compose up
```
2. http://localhost:3000/home で表示確認


## Rspec

#### 実行方法

https://github.com/rspec/rspec-rails/tree/v6.0.0.rc1#running-specs
```shell
$ docker-compose run --rm web bundle exec rspec
```

## Rubocop

#### チェック

```shell
$ docker-compose run --rm --no-deps web buncle exec rubocop
```

## brakeman

#### チェック

```shell
$ docker compose run --no-deps web bundle exec brakeman
```

## その他
#### bundle install

```shell
$ docker compose run --rm --no-deps web bundle install 
```

#### rails-templateのアップデート

```shell
$ git remote add template git@github.com:salvage0707/rails-template-v1.git
$ git pull template main
```