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
### Association
- has_many :items
- has_one :address
- has_one :purchase

## items テーブル

| Colum            | Type     | options      |
|------------------|----------|--------------|
| name             | string   | null false   |
| description      | text     | null false   |
| image            | string   | null false   |
| price            | integer  | null false   |
| user_id          | integer  | null false   |
| category_id      | integer  | null false   |
| status_id        | integer  | null false   |
| delivery_fee_id  | integer  | null false   |
| prefecture_id    | integer  | null false   |
| shipping_date_id | integer  | null false   |

## Association
- belongs_to :user
- has_one :purchase

## addresses テーブル

| Colum           | Type     | options      |
|-----------------|----------|--------------|
| postal_number   | string   | null false   |
| prefecture      | string   | null false   |
| city            | string   | null false   |
| brock_number    | string   | null false   |
| building_name   | string   |              |
| phone_number    | string   | null false   |
| purchase_id     | integer  | null false   |

## Association
- belongs_to :user
- has_one :purchase

## purchases テーブル

| Colum     | Type    | options    |
|-----------|---------|------------|
| user_id   | integer | null false |
| item_id   | integer | null false |

## Association
- belongs_to :user
- belongs_to :item
- has_one :address
