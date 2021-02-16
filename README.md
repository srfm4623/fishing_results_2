# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| area               | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |

### Association

- has_many :results
- has_many :comments

## results テーブル

| Column | Type       | Options           |
| ------ | ---------- | ----------------- |
| title  | string     | null: false       |
| length | string     |                   |
| weight | string     |                   |
| area   | string     |                   |
| means  | string     |                   |
| text   | text       | null: false       |
| user   | references | foreign_key: true |

### Association

- belongs_to :user
- has_many   :comments

## comments テーブル

| Column  | Type       | Options           |
| ------- | ---------- | ----------------- |
| text    | text       | null: false       |
| user    | references | foreign_key: true |
| results | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :results

