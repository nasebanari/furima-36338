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

| Column             | Type     | Options      |
| ------------------ | ------   | -------------|
| nickname           | string   | unique: true |
| email              | string   | unique: true |
| encrypted_password | string   | null: false  |
| last_name          | string   | null: false  |
| first_name         | string   | null: false  |
| last_name_kana     | string   | null: false  |
| first_name_kana    | string   | null: false  | 
| birthday           | date     | null: false  |

## Association
has_many :items
has_many :orders


## items テーブル

| Column             | Type        | Options                         |
| ------------------ | ----------- | ------------------------------- |
| image              | string      | null: false                     |
| product_name       | string      | null: false                     | 
| explanation        | text        | null: false                     |
| category           | integer     | null: false                     |
| condition          | integer     | null: false                     |
| shipping-cost      | integer     | null: false                     | 
| shipping-agent     | integer     | null: false                     |
| shopping-day       | integer     | null: false                     |
| price              | integer     | null: false                     |
| user               | references  | null: false foreign_key: true   |

## Association
belong_to: users
has_one: orders

## orders テーブル
| Column             | Type      | Options                        |
| ------------------ | --------- | ------------------------------ |
| user               |references | null: false foreign_key: true  |
| item               |references | null: false foreign_key: true  |
## Association
has_one: payer-namber
belong_to: items
belong_to: users

## payers テーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| prefecture         | string | null: false |
| city               | string | null: false |
| address            | string | null: false |
| building           | string | null: false |
| phone-number       | string | null: false |

## Association
belong_to: orders