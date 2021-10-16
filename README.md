

# テーブル設計

## users テーブル

| Column             | Type     | Options                  |
| ------------------ | ------   | -------------------------|
| nickname           | string   | null: false              |
| email              | string   | unique: true,null: false |
| encrypted_password | string   | null: false              |
| last_name          | string   | null: false              |
| first_name         | string   | null: false              |
| last_name_kana     | string   | null: false              |
| first_name_kana    | string   | null: false              | 
| birthday           | date     | null: false              |

## Association
has_many :items
has_many :orders


## items テーブル

| Column             | Type        | Options                         |
| ------------------ | ----------- | ------------------------------- |
| product_name       | string      | null: false                     | 
| explanation        | text        | null: false                     |
| category_id        | integer     | null: false                     |
| condition_id       | integer     | null: false                     |
| shipping_cost_id   | integer     | null: false                     | 
| shipping_agent_id  | integer     | null: false                     |
| shopping_day_id    | integer     | null: false                     |
| price              | integer     | null: false                     |
| user               | references  | null: false foreign_key: true   |

## Association
belong_to: user
has_one: order

## orders テーブル
| Column             | Type      | Options                        |
| ------------------ | --------- | ------------------------------ |
| user               |references | null: false foreign_key: true  |
| item               |references | null: false foreign_key: true  |
## Association
has_one: payer
belong_to: item
belong_to: user

## payers テーブル
| Column             | Type       | Options                      |
| ------------------ | -----------| ---------------------------- |
| shipping_agent_id  | integer    | null: false                  |
| city               | string     | null: false                  |
| address            | string     | null: false                  |
| building           | string     |                              |
| postal_code        | string     | null: false                  | 
| phone_number       | string     | null: false                  |
| order              | references | null: false foreign_key: true|

## Association
belong_to: order