# README
![original](https://user-images.githubusercontent.com/69024430/95948327-51947b00-0e2b-11eb-9723-239f7def4aaa.jpg)

<h2 align="center">Skill Movie</h2>

# アプリ名
- Skill Movie

# 概要
 「バスケスキルを上達させる、増やす！」
 バスケが上手くなりたい、ライバルに差をつけたいと常日頃から思っている方に向けた、動画専用投稿アプリです。
- 自分の得意技を自慢できる！
- 人の投稿を見て、スキルを盗める！
- 出来なかったスキルができるようになる喜びが味わえる！

# URL
 https://sports-app-28797.herokuapp.com/

【かんたんログイン】ボタンからテストユーザーとしてログインできます。

# 制作の背景
 私はバスケットボールを13年間続けてきました。

 小さい頃からプロ選手の真似をよくしていましたが、毎回ビデオを再生することに面倒臭さを感じていました。また、上手い選手のスキルを真似したくても、教えて貰える機会はありませんでした。

 そこで、世界中のバスケットマンが自分のスキルを披露できる場を設ければ、多くの人が手軽にスキルを学べる機会を作り出すことができるのではないかと考えこのサービスを制作しました。同時に、このアプリケーションを通して日本のバスケットボールを盛り上げていきたいと思っています。

# 機能一覧
- 動画(投稿・編集）機能
- ログイン機能
- コメント機能
- いいね機能
- カテゴリー検索機能

# 環境・使用技術

### フロントエンド
* Bootsnap 1.4.2
* ransack
* SCSS (BEM)
* JavaScript

### バックエンド
* Ruby 2.6.5
* Rails 6.0.0

### 開発環境
* MySQL2

### 本番環境
* heroku
* MySQL2
* Nginx、 Puma

### その他使用技術
* 非同期通信 (いいね機能)
* devise (ログイン・ログアウト機能)
* carrierwave (動画投稿機能)
* Rubocop-airbnb
* チーム開発を意識したGitHubの活用 （プルリクエスト、マージ）


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
| category | references | null: false, foreign_key: true |
| movie    | string     | null: false                    |
| user     | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :comments
- has_many :likes
- has_many :favorites
- has_many :users, through: :favorites
- belongs_to :category

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

## Categories テーブル

| Column  | Type       | Options     |
| ------- | ---------- | ------------|
| name    | string     | null: false |

### Association

- has_many :posts