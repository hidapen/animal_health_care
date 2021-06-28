# README

## users テーブル

| Column              | Type    | Options                   |
| ------------------- | ------- | ------------------------- |
| email               | string  | null: false, unique: true |
| encrypted_password  | string  | null: false               |
| human_first_name    | string  | null: false               |
| human_last_name     | string  | null: false               |
| first_name_rubi     | string  | null: false               |
| last_name_rubi      | string  | null: false               |
| pets_name           | string  | null: false               |
| pets_name_rubi      | string  | null: false               |
| pets_type           | string  | null: false               |
| unknown_id          | integer |                           |
| pets_birthday       | date    |                           |
| pets_age            | integer | null: false               |

### Association

- has_many :tweets
- has_many :memos

## tweets テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| energy_id       | integer    | null: false                    |
| food_id         | integer    | null: false                    |
| toilet_count_id | integer    | null: false                    |
| poop_status_id  | integer    | null: false                    |
| exercise_id     | integer    | null: false                    |
| sleep_id        | integer    | null: false                    |
| different_id    | integer    |                                |
| user            | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :memo

## memos テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| energy_memo       | text       |                                |
| food_memo         | text       |                                |
| toilet_count_memo | text       |                                |
| poop_status_memo  | text       |                                |
| exercise_memo     | text       |                                |
| sleep_memo        | text       |                                |
| different_memo    | text       |                                |
| user              | references | null: false, foreign_key: true |
| item              | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :tweet
