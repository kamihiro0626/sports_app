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

| Column   | Type        | Options       |
| ---------| ----------- | --------------|
| nickname | string      | null: false   |
| email    | string      | null: false   |
| password | string      | null: false   |

### Association

- has_many :posts
- has_many :comments
- has_many :likes
- has_many :favorites
- has_many :fav_posts, through: :favorites, source: :post

## posts テーブル

| Colum    | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| title    | string     | null: false                    |
| content  | text       | null: false                    |
| category | integer    | null: false                    |
| movie    | string     | null: false                    |
| user     | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :comments
- has_many :likes
- has_many :favorites
- has_many :users, through: :favorites

## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| text    | text       | null: false
| user    | references | null: false, foreign_key: true |
| psot    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :post

## likes テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| post    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :post

## favorites テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| psot    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :post