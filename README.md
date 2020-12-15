# テーブル設計

## users テーブル

| Column            | Type     | Options     |
| --------          | ------   | ----------- |
| email             | string   | null: false |
| nickname          | string   | null: false |
| birthday          | date     | null: false |
| encrypted_password| string   | null: false | 
| first_name        | string   | null: false |
| last_name         | string   | null: false |
| first_name_kana   | string   | null: false |
| last_name_kana    | string   | null: false |
| sex               | string   | null: false |
| age               | string   | null: false |


### Association

- has_many :job
- has_many :item

## jobs テーブル

| Column             | Type       | Options                        |
| ------             | ------     | -----------                    |
| title              | string     | null: false                    |
| jikyu              | integer    | null: false                    |
| period             | integer    | null: false                    |
| number_of_people   | integer    | null: false                    |
| contents           | text       | null: false                    |
| prefecture_id      | integer    | null: false                    |
| working_hours      | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association

-has_one :application_record
-belongs_to :user

## application_record テーブル

| Column  | Type       | Options                        |
| ------  | ---------- | ------------------------------ |
| user    |references  | null: false, foreign_key: true |
| job     |references  | null: false, foreign_key: true |

### Association

-belongs_to :item
-belongs_to :user
