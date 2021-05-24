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

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| nickname           | string     | null: false |
| email              | string     | null: false |
| encrypted_password | string     | null: false |
| last_name          | string     | null: false |
| first_name         | string     | null: false |
| last_name_kana     | string     | null: false |
| first_name_kana    | string     | null: false |
| birthday           | date       | null: false |

### Association

- has_many :items
- has_many :orders



## items テーブル

| Column           | Type         | Options                        |
| ---------------- | ------------ | ------------------------------ |
| item_name        | string       | null: false                    |
| item_description | text         | null: false                    |
| price            | integer      | null: false                    |
| category_id      | integer      | null: false                    |
| condition_id     | integer      | null: false                    |
| payment_id       | integer      | null: false                    |
| prefecture_id    | integer      | null: false                    |
| delivery_time_id | integer      | null: false                    |
| user             | references   | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order



## orders テーブル

| Column           | Type         | Options                        |
| ---------------- | ------------ | ------------------------------ |
| purchases_price  | integer      | null: false                    |
| item             | references   | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :item
- has_one :address



## addresses テーブル

| Column           | Type         | Options                        |
| ---------------- | ------------ | ------------------------------ |
| potal_code       | integer      | null: false                    |
| prefecture       | integer      | null: false                    |
| city             | string       | null: false                    |
| address           | string       | null: false                    |
| building         | string       |                                |
| phone_number     | integer      | null: false                    |
| order            | references   | null: false, foreign_key: true |


### Association

- belongs_to :order
- belongs_to_active_hash :prefecture


