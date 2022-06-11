# アプリケーション名
## ・お弁当投稿アプリ
# アプリケーション概要
お弁当を投稿し、コミュニケーションがとることでその日の献立やレシピを共有できる。
# URL
https://github.com/kinyasunori/bento-0826
# テスト用アカウント

# 利用方法

# アプリケーションを作成した背景

# 洗い出した要件
https://docs.google.com/spreadsheets/d/18uT_FAjXoioy3X9dH2Yk0jOHR8uWZJ8gm_UA1VlnCdc/edit#gid=982722306
# 実装した機能についての画像やGIFおよびその説明※

# 実装予定の機能

# ER図
[![Image from Gyazo](https://i.gyazo.com/cc14b47c8d9ab6e563c595871d04d2d0.png)](https://gyazo.com/cc14b47c8d9ab6e563c595871d04d2d0)

# 画面遷移図
[![Image from Gyazo](https://i.gyazo.com/b2306dcef54045cf77e6595b1fa586e6.png)](https://gyazo.com/b2306dcef54045cf77e6595b1fa586e6)

# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| profile            | text   | null: false               |


### Association

- has_many :posts
- has_many :comments


## posts テーブル

| Column      | Type        | Options                        |
| ----------- | ----------- | ------------------------------ |
| title       | string      | null: false                    |
| menu        | text        | null: false                    |  
| recipe      | text        |                     |
| user_id     | references  | null: false, foreign_key: true |

### Association

- has_many :comments
- belongs_to :user


## comments テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| content   | text       | null: false                    |
| post_id   | references | null: false, foreign_key: true |
| user_id   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :post
