#　テーブル設計

## users テーブル

| Column             | Type      | Options                        |
|------------------- | --------- | ------------------------------ |
| nickname           | string    | null: false                    |
| encrypted_password | string    | null: false                    |   
| mail_address       | string    | null: false, unique: true      |
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
| user_id            | references | null: false, foreign_key       |
| name               | string     | null: false                    |
| category_id        | integer    | null: false                    |
| status_id          | integer    | null: false                    |
| description        | text       | null: false                    |
| cost_id            | integer    | null: false                    |
| prefecture_id      | integer    | null: false                    |
| day_id             | integer    | null: false                    |
| price              | integer    | null: false                    |
| commission         | integer    | null: false                    |
| profit             | integer    | null: false                    |



### Association

- has_one :purchases
- belongs_to :users



## deliveries テーブル

| Column             | Type       | Options                        |
|------------------- | ---------- | ------------------------------ |
| address            | integer    | null: false                    |
| post_code          | integer    | null: false                    |
| prefecture         | integer    | null: false                    |
| city               | string     | null: false                    |
| street_address     | integer    | null: false                    |
| building_name      | string     | null: false                    |
| phone_number       | integer    | null: false                    |



### Association

- has_one :purchases


## purchases テーブル

| Column             | Type       | Options                        |
|------------------- | ---------- | ------------------------------ |
| user_id            | references | null: false, foreign_key       |
| purchase_id        | references | null: false                    |


### Association

- has_one :deliveries
- has_one :products
- belongs_to :users