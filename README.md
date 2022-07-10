# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## setup

1. データベース作成
```shell
$ docker compose run web rails db:create db:migrate 
```
1. 起動確認
起動し、localhost:3000にアクセスする
```shell
$ docker-compose up
```
