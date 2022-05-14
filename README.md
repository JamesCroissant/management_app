# テーブル設計

## usersテーブル

| Column               | Type   | Options                   |
| -------------------- | ------ | ------------------------- |
| nickname             | string | null: false               |
| email                | string | null: false, unique: false|
| encrypted_password   | string | null: false               |
| family_name          | string | null: false               |
| first_name           | string | null: false               |
| birthday             | date   | null: false               |
| occupation           | string | null: false               |
| phone_number         | string | null: false               |


### Association

- has_many :cars
- has_many :schedules


# carsテーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| car_name             | integer    | null: false                    |
| car_number           | string     | null: false                    |
| car_model            | string     | null: false                    |
| user                 | references | null: false, foreign_key: true |


## Association

- belongs_to :user
- has_one :schedule


# schedulesテーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| plan                 | string     | null: false                    |
| start_time           | datetime   | null: false                    |
| end_time             | datetime   | null: false                    |
| content              | string     | null: false                    |
| user                 | references | null: false, foreign_key: true |
| car                  | references | null: false, foreign_key: true |


## Association

- belongs_to :user
- belongs_to :car


# アプリケーション名
Car Sharing

# アプリケーション概要
家族間で使用する車をスケジュール表を用いて管理することで、ダブルブッキング等のトラブルを防ぐ事ができる

# URL

# テスト用アカウント
・Basic認証パスワード・・・0501
・Basic認証ID・・・James
・メールアドレス・・・rino@email.com
・パスワード・・・rino123

# 利用方法
1. トップページ（一覧ページ）のヘッダーからユーザー新規登録を行う
2. ユーザー登録が完了したらトップページより、使いたい車を選び、日付を選択し、予約する

# アプリケーションを作成した背景
私の家族は両親と私の3人が車を普段から使用し、それに対して車は2台しかなく、頻繁に「両親が車を使用するから、車が使用できない」というトラブルが発生していた。それを家族3人で一つのアプリで共有することができれば解決できると考え、開発を試みた。

# 洗い出した要件
https://docs.google.com/spreadsheets/d/1SuE28LFn7pAVjDvo-IjwWNuj2pFoy7X7NPplziJgS4A/edit#gid=982722306


