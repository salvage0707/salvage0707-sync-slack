# README

## 概要

Rails7を使った開発用テンプレート

## 環境

|ツール| バージョン| 説明|
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

## setup

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


## その他
#### bundle install
```shell
$ docker compose run --no-deps web bundle install 
```