#　テーブル設計

## users テーブル

| Column             | Type      | Options                        |
|------------------- | --------- | ------------------------------ |
| nickname           | string    | null: false                    |
| encrypted_password | string    | null: false                    |   
| email              | string    | null: false, unique: true      |
| family_name        | string    | null: false                    | 
| first_name         | string    | null: false                    |
| family_name_kana   | string    | null: false                    |
| first_name_kana    | string    | null: false                    |
| birth_day          | date      | null: false                    |


### Association

- has_many :products
- has_many :purchases



## products テーブル

| Column             | Type       | Options                        |
|------------------- | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| name               | string     | null: false                    |
| category_id        | integer    | null: false                    |
| status_id          | integer    | null: false                    |
| description        | text       | null: false                    |
| cost_id            | integer    | null: false                    |
| prefecture_id      | integer    | null: false                    |
| day_id             | integer    | null: false                    |
| price              | integer    | null: false                    |



### Association

- has_one :purchase
- belongs_to :user



## deliveries テーブル

| Column             | Type       | Options                        |
|------------------- | ---------- | ------------------------------ |
| address            | string     | null: false                    |
| post_code          | string     | null: false                    |
| prefecture_id      | integer    | null: false                    |
| city               | string     | null: false                    |
| street_address     | string     | null: false                    |
| building_name      | string     |                                |
| phone_number       | string     | null: false                    |



### Association

- has_one :delivery


## purchases テーブル

| Column             | Type       | Options                        |
|------------------- | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| product            | references | null: false, foreign_key: true |


### Association

- has_one :delivery
- has_many :purchases
- belongs_to :user