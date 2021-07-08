# README

* アプリ名：Animal health care

* 概要（このアプリでできること）
>このアプリケーションは飼い主によりペットの様子を記録できます。毎日記録する手間をできるだけ省けるように記述式ではなく,質問形式かつ回答を選択式にすることで継続しやすい仕様になっております。日々記録された情報を元に飼い主がペットの体調の変化を可視化することで、ペットの体調管理に繋げられます。また、ペットの情報を獣医師へ共有する際に、記録された内容からより正確な情報を提供できます。つまり、日々の記録がペットの状態を判断する情報源となり、予防あるいは対処療法へ役立つアプリケーションとなっております。

* 本番環境
>デプロイ先：https://animal-health-care.herokuapp.com/

>ユーザー認証ID：hidapen　PASS：0630

>テストアカウントID:test@test　PASS：test111

* アプリの利用方法
1. ユーザー管理機能（新規登録/ログイン/ログアウト）
1. 投稿機能
1. 投稿一覧表示機能
1. 投稿詳細表示機能
1. 投稿編集機能
1. 投稿削除機能
>上記６つの機能により飼い主がペットの普段の様子を記録できます。トップページの記録ボタンをクリックすると新規投稿ページへ遷移します。投稿されるとトップページのカレンダーに記録された日の色が変わり詳細ボタンが表示されます。詳細ボタンをクリックすると詳細ページへ遷移します。投稿内容の詳細が表示される他、編集と削除ボタンが表示されます。編集ボタンをクリックすると編集ページへ遷移し投稿内容を編集できます。また、削除ボタンをクリックすると投稿は削除されトップページへ遷移されます。

* 制作背景（意図：どんな課題や不便なことを解決するためにこのアプリを作ったのか）
>課題：獣医師と飼い主の情報共有・飼い主の知識量の差・人間の記憶力

>人間誰しもが忘れる生き物ですので、普段のペットの様子を完璧に記憶することは難しいと考えました。そこで、ペットの様子を記録できるアプリケーションを開発しようと決意しました。

>飼い主が獣医師へペットについての情報を共有する際、獣医師が必要とする情報を正確に伝えることで、ペットの状態をより正確な判断ができるのではないかと考えました。そこで、ポイントを絞って日々ペットの状態を記録することで曖昧な情報ではなく正確な情報伝達を可能にすることを目的に開発に挑みました。

>動物に関する知識が不足している場合、動物らの体調管理を誤った方法で行われることを危惧していました。そこで、普段何に気をつけるべきか観察ポイントを絞って日々ペットの状態を記録することで、ペットと過ごす上で必要なポイントを抑えられるように継続しやすいアプリケーションを開発しようと考えました。

* 洗い出した要件
1. ユーザー管理機能（新規登録/ログイン/ログアウト）
1. 投稿機能
1. 投稿一覧表示機能
1. 投稿詳細表示機能
1. 投稿編集機能
1. 投稿削除機能

* データベース設計
## users テーブル

| Column                | Type    | Options                   |
| --------------------- | ------- | ------------------------- |
| email                 | string  | null: false, unique: true |
| encrypted_password    | string  | null: false               |
| human_first_name      | string  | null: false               |
| human_last_name       | string  | null: false               |
| human_first_name_rubi | string  | null: false               |
| human_last_name_rubi  | string  | null: false               |
| pets_name             | string  | null: false               |
| pets_name_rubi        | string  | null: false               |
| pets_type             | string  | null: false               |
| pets_birthday         | date    |                           |
| pets_age              | integer | null: false               |

### Association

- has_many :tweets

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
| memo            | text       |                                |
| user            | references | null: false, foreign_key: true |
| start_time      | datetime   |                                |

### Association

- belongs_to :user

* DEMO（gitで動画や写真をはって、ビューのイメージをつかんでもらう）

* 特にデプロイができていない場合はDEMOをつけることで見た目を企業側に伝えられる（工夫したポイント・使用技術（開発環境）・課題や今後実装したい機能・DB設計）