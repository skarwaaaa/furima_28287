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

| Colum           | Type     | options      |
|-----------------|----------|--------------|
| nickname        | string   | null false   |
| email           | string   | null false default: "" |
| password        | string   | null false   |
| lastname        | string   | null false   |
| firstname       | string   | null false   |
| lastname_kana   | string   | null false   |
| firstname_kana  | string   | null false   |
| birthday        | date     | null false   |

### Association
- has_many :items
- has_one :addresses
- has_one :purchase

## items テーブル

| Colum            | Type    | options       |
|------------------|---------|---------------|
| name             | string  | null false    |
| description      | text    | null false    |
| image            | string  | null false    |
| price            | integer | null false    |
| user_id          | integer | null false    |
| category_id      | integer | null false    |
| status_id        | integer  | null false   |
| delivery_fee_id  | integer  | null false   |
| prefecture_id    | integer  | null false   |
| shipping_date_id | integer  | null false   |

## Association
- belongs_to :user
- has_one :purchase

## addressese テーブル

| Colum           | Type     | options      |
|-----------------|----------|--------------|
| postal_number   | integer  | null false   |
| prefecture      | string   | null false   |
| city            | string   | null false   |
| brock_number    | string   | null false   |
| building_name   | string   |              |
| phone_number    | integer  | null false   |
| purchase_id     | integer  | null false   |

## Association
- belongs_to :user
- has_one_ :purchase

## purchases テーブル

| Colum     | Type    | options    |
|-----------|---------|------------|
| user_id   | integer | null false |
| item_id   | integer | null false |

## Association
- has_one :user
- has_one :item
