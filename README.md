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

| Column           | Type       | Options     |
| ---------------- | ---------- | ----------- |
| nickname         | string     | null: false |
| email            | string     | null: false |
| password         | string     | null: false |
| last_name        | string     | null: false |
| first_name       | string     | null: false |
| last_name_kana   | string     | null: false |
| first_name_kana  | string     | null: false |
| birthday         | integer    | null: false |

### Association

- has_many :items



## items テーブル

| Column           | Type         | Options                        |
| ---------------- | ------------ | ------------------------------ |
| image            | ActiveStrage |                                |
| item_name        | string       | null: false                    |
| item_description | text         | null: false                    |
| price            | integer      | null: false                    |
| category         | integer      | null: false                    |
| condition        | integer      | null: false                    |
| payment          | integer      | null: false                    |
| prefecture       | integer      | null: false                    |
| delivery_time    | integer      | null: false                    |
| user             | references   | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order
- belongs_to_active_hash :condition
- belongs_to_active_hash :category
- belongs_to_active_hash :payment
- belongs_to_active_hash :prefecture
- belongs_to_active_hash :delivery_time



## order テーブル

| Column           | Type         | Options                        |
| ---------------- | ------------ | ------------------------------ |
| purchases_price  | integer      | null: false                    |
| item             | references   | null: false, foreign_key: true |


### Association

- belongs_to :item
- has_one :adress



## adress テーブル

| Column           | Type         | Options                        |
| ---------------- | ------------ | ------------------------------ |
| potal_code       | integer      | null: false                    |
| prefecture       | integer      | null: false                    |
| city             | string       | null: false                    |
| adress           | string       | null: false                    |
| building         | string       |                                |
| phone_number     | integer      | null: false                    |
| order            | references   | null: false, foreign_key: true |


### Association

- belongs_to :order
- belongs_to_active_hash :prefecture


