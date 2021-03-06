## Users テーブル
| Column            | Type    | Options     |
| ----------------- | ------  | ----------- |
| name              | string  | null: false |
| email             | string  | null: false |
| password          | string  | null: false |
| family_name       | string  | null: false |
| first_name        | string  | null: false |
| family_name_kana  | string  | null: false |
| first_name_kana   | string  | null: false |
| birth_day         | date    | null: false |

### Association
- has_many :items
- has_many :purchases


## Items テーブル
| Column             | Type    | Options                        |
| ------------------ | ------- | ------------------------------ |
| name               | string  | null: false                    |
| description        | text    | null: false                    |
| price              | integer | null: false                    |
| category_id        | integer | null: false                    |
| condition_id       | integer | null: false                    |
| postage_payer_id   | integer | null: false                    |
| prefecture_id      | integer | null: false                    |
| preparation_day_id | integer | null: false                    |
| user_id            | integer | null: false, foreign_key: true |

### Association
- belongs to :user
- has_one :purchase


## Purchases テーブル
| Column          | Type    | Options                        |
| --------------- | ------- | ------------------------------ |
| user_id         | integer | null: false, foreign_key: true |
| item_id         | integer | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :delivery


## Delivery テーブル
| Column           | Type       | Options           |
| ---------------- | ---------- | ----------------- |
| post_code        | string     | null: false       |
| prefecture       | integer    | null: false       |
| city             | string     | null: false       |
| house_number     | string     | null: false       |
| building_name    | string     |                   |
| phone_number     | string     | null: false       |
| purchase         | references | foreign_key: true |

### Association
- belongs_to :purchase