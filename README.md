## Users テーブル
| Column      | Type    | Options     |
| ----------- | ------  | ----------- |
| name        | string  | null: false |
| email       | string  | null: false |
| password    | string  | null: false |

### Association
- has_many :items
- has_one :profile
- has_one :credit_card


## Profiles テーブル
| Column            | Type    | Options     |
| ----------------- | ------  | ----------- |
| family_name       | string  | null: false |
| first_name        | string  | null: false |
| family_name_kana  | string  | null: false |
| first_name_kana   | string  | null: false |
| birth_year        | string  | null: false |
| birth_month       | string  | null: false |
| birth_day         | string  | null: false |

### Association
- belongs_to: user


## Credit_cards テーブル
| Column        | Type        | Options                        |
| ------------- | ----------- | ------------------------------ |
| card_number   | integer     | null: false                    |
| exp_year      | integer     | null: false                    |
| exp_month     | integer     | null: false                    |
| security_code | integer     | null: false                    |
| user_id       | references  | null: false, foreign_key: true |

### Association
- belongs_to: user


## Items テーブル
| Column         | Type    | Options     |
| -------------- | ------  | ----------- |
| name           | string  | null: false |
| description    | string  | null: false |
| price          | integer | null: false |
### Association
- belongs to :user
- has_one :image
- has_one :category
- has_one :condition
- has_one :postage_payer
- has_one :shipping_origin
- has_one :preparation_day


## Images テーブル
| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| url     | string     | null: false,                   |
| item_id | references | null: false, foreign_key: true |

### Association
belongs_to :user


## Categories テーブル
| Column   | Type    | Options      |
| -------- | ------- | ------------ |
| category | string  | null: false  |

### Association
has_many :items


## Conditions テーブル
| Column   | Type    | Options      |
| -------- | ------- | ------------ |
| category | string  | null: false  |

### Association
has_many :items


## Postage_payer テーブル
| Column        | Type    | Options      |
| ------------- | ------- | ------------ |
| postage_payer | string  | null: false  |

### Association
has_many :items


## Shipping_origins テーブル
| Column          | Type    | Options      |
| --------------- | ------- | ------------ |
| shipping_origin | string  | null: false  |

### Association
has_many :items


## Preparation_days テーブル
| Column          | Type    | Options      |
| --------------- | ------- | ------------ |
| preparation_day | integer | null: false  |

### Association
has_many :items