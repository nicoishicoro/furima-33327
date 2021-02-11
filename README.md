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

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| nickname        | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| last-name       | string | null: false |
| first-name      | string | null: false |
| last-name-kana  | string | null: false |
| first-name-kana | string | null: false |
| birth-date      | string | null: false |

### Association

- has_many :items
- has_many :purchase-items
- belongs_to :destinations

## items テーブル

| Column                   | Type       | Options                        |
| ------------------------ | ---------- | ------------------------------ |
| item-name                | string     | null: false                    |
| item-info                | text       | null: false                    |
| item-category            | string     | null: false                    |
| item-sales-status        | text       | null: false                    |
| item-shipping-fee-status | string     | null: false                    |
| item-prefecture          | string     | null: false                    |
| item-scheduled-delivery  | string     | null: false                    |
| item-price               | string     | null: false                    |
| add-tax-price            | string     | null: false                    |
| profit                   | string     | null: false                    |
| user                     | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :purchase-items

## purchase-items テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| item-name    | string     | null: false                    |
| item-price   | string     | null: false                    |
| user         | references | null: false, foreign_key: true |
| item         | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :destination

## destinations テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| postal-code  | string     | null: false                    |
| prefecture   | string     | null: false                    |
| city         | string     | null: false                    |
| address      | text       | null: false                    |
| building     | text       | null: false                    |
| phone-number | string     | null: false                    |
| user         | references | null: false, foreign_key: true |
| item         | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase-items