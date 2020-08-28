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
- has_many :deliveries


## Items テーブル
| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| name            | string     | null: false                    |
| description     | text       | null: false                    |
| price           | integer    | null: false                    |
| category        | integer    | null: false                    |
| condition       | integer    | null: false                    |
| postage_payer   | integer    | null: false                    |
| shipping_origin | integer    | null: false                    |
| preparation_day | integer    | null: false                    |
| user_id         | references | null: false, foreign_key: true |

### Association
- belongs to :user
- has_one :image
- has_one :purchase
- has_one :delivery


## Images テーブル
| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| url     | string     | null: false,                   |
| item_id | references | null: false, foreign_key: true |

### Association
- belongs_to :item


## Purchases テーブル
| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| card_number     | integer    | null: false                    |
| exp_year        | integer    | null: false                    |
| exp_month       | integer    | null: false                    |
| security_code   | integer    | null: false                    |
| user_id         | references | null: false, foreign_key: true |
| item_id         | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :delivery


## Delivery テーブル
| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| post_code        | integer    | null: false                    |
| shipping_address | string     | null: false                    |
| user_id          | references | null: false, foreign_key: true |
| item_id          | references | null: false, foreign_key: true |
| purchase_id      | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- belongs_to :purchase