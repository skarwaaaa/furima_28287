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
| familyname      | string   | null false   |
| firstname       | string   | null false   |
| familyname_kana | string   | null false   |
| firstname_kana  | string   | null false   |
| birthday        | datetime | null false   |

### Association
- has_many :items

## items テーブル

| Colum       | Type    | options      |
|-------------|---------|--------------|
| name        | string  | null false   |
| description | text    | null false   |
| image       | string  | null false   |
| price       | integer | null false   |
| user_id     | integer | null false  foreign_key: true |

## Association
- belongs_to :user