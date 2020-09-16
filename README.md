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

# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | null: false |
| password | string | null: false |
| name     | string | null: false |
| birthday | integer| null: false |
| telnumber| integer| null: false |

### Association

- has_many :items
- has_many :buyers

## items テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| image  | string | null: false |
| name   | string | null: false |
| text   | text   | null: false |
|category| string | null: false |
| status | string | null: false |
|delivery| string | null: false |
| area   | string | null: false |
| day    |integer | null: false |
| price  | integer| null: false |
|user_id |references| null: false |

### Association

- belongs_to :user
- belongs_to :buyer

## buyers テーブル

| Column | Type       | Options      |
| ------ | ---------- | -------------|
| price  | integer    | null: false  |
| address| string     | null: false  |
| item_id| references | null: false  |

### Association

- has_many :users
- has_many :items

