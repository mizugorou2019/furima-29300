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
| birth_year        | date    | null: false |
| birth_month       | date    | null: false |
| birth_day         | date    | null: false |

### Association
- has_many :items


## Items テーブル
| Column          | Type    | Options     |
| --------------- | ------  | ----------- |
| name            | string  | null: false |
| description     | string  | null: false |
| price           | integer | null: false |
| category        | integer | null: false |
| condition       | integer | null: false |
| postage_payer   | integer | null: false |
| shipping_origin | integer | null: false |
| preparation_day | integer | null: false |

### Association
- belongs to :user
- has_one :image


## Images テーブル
| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| url     | string     | null: false,                   |
| item_id | references | null: false, foreign_key: true |

### Association
belongs_to :item