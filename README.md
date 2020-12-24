・アプリケーション名 
  SimpleJob
・アプリケーションの概要
 1日単位の仕事の募集と応募を手軽に出来る。
・利用方法
 マッチングアプリの様にユーザーはやってみたい仕事に申請を送り
 企業側がいい人材だと感じたらマッチングが成立して
 仕事を始める事が出来る。

 .目指した課題解決
 サービス業での急な欠勤や慢性的な人員不足で誰でも簡単に出来る様な仕事に人手を
 割かれてしまっている事を解決したい。


・新規登録機能
>
ユーザーと企業で別々のボタンから登録出来る。
・投稿機能
>
仕事の情報を投稿出来る。
・検索機能
>
今後実装予定
・マッチング機能
>
今後実装予定

開発環境
Ruby / Ruby on Rails / MySQL / GitHub / Heroku / Visual Studio Code




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

