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

| Column       | Type   | Options     |
| ------------ | ------ | ----------- |
| nickname     | string | null: false |
| email        | string | null: false |
| password     | string | null: false |
| first_name   | string | null: false |
| last_name    | string | null: false |
|furigana_frist| string | null: false |
|furigana_last | string | null: false |
| birthday     | date   | null: false |


### Association

- has_many :items
- has_many :shoppings

## items テーブル

| Column    | Type   | Options     |
| --------- | ------ | ----------- |
|   name    |  string | null: false |
|   text    |  text   | null: false |
|category_id| integer | null: false |
| status_id | integer | null: false |
|delivery_id| integer | null: false |
|  area_id  | integer | null: false |
|  day_id   | integer | null: false |
|   price   | integer | null: false |
|  user_id  |references| null: false, foreign_key: true  |

### Association

- belongs_to :user
- has_one :shopping

## shoppings テーブル
 
| Column  |    Type    | Options                        |
| --------| ---------- | -------------------------------|
| user_id | references | null: false, foreign_key: true |
| item_id | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column      | Type       | Options      |
| ------------| ---------- | -------------|
| shopping_id | references | null: false, foreign_key: true |
| postal_code | integer    | null: false |
| prefecture  | string     | null: false |
| city        | string     | null: false |
| lot_number  | string     | null: false |
|  building   | string     | null: false |
| tel_number  | integer    | null: false |


### Association

- belongs_to :shopping

