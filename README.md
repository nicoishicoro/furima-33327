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

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_name_kana     | string | null: false |
| first_name_kana    | string | null: false |
| birth-date         | data   | null: false |

### Association

- has_many :items
- has_many :purchase_items

## items テーブル

| Column                   | Type       | Options                        |
| ------------------------ | ---------- | ------------------------------ |
| item_name                | string     | null: false                    |
| item_info                | text       | null: false                    |
| item_sales_status        | text       | null: false                    |
| item_shipping_fee_status | string     | null: false                    |
| item-prefecture          | string     | null: false                    |
| item-scheduled-delivery  | integer    | null: false                    |
| purchase_item_id         | integer    | null: false                    |
| user                     | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- has_one :purchase_items

## purchase_items テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| user         | references | null: false, foreign_key: true |
| item         | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :destination

## destinations テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| postal-code      | integer    | null: false                    |
| purchase_item_id | integer    | null: false                    |
| city             | string     | null: false                    |
| address          | string     | null: false                    |
| building         | string     |                                |
| phone-number     | string     | null: false                    |

### Association

- belongs_to :purchase_items