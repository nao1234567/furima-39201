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
| shipping_date_id   | integer    | null: false                    |
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
| purchase           | references | null: false, foreign_key: true |
| building_name      | string     | null: false                    |
| phone_number       | string     | null: false                    |

<!-- purchaseの外部キーカラムを追加しましょう。 -->
<!-- このカラムを追加することで、１つの配送先情報に「誰が購入したどの商品の購入履歴情報か」を紐付けることができます。 -->

<!-- 電話番号のカラム型は文字列型。電話番号のように先頭が0で始まるものは、整数型としますと0落ちという先頭の0が消える現象が起きるためです。 -->

### Association

has_one :purchase


## purchases テーブル

| Column             | Type       | Options                        |
|------------------- | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| product            | references | null: false, foreign_key: true |


### Association

- belongs_to :product
- belongs_to :user
- has_one :delivery