# テーブル設計

## users テーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| surname_kanji      | string | null: false |
| first_name_kanji   | string | null: false |
| surname_kana       | string | null: false |
| first_name_kana    | string | null: false |
| date_of_birth      | date   | null: false |

### Association
- has_many :items
- has_many :comments
- has_many :purchases

## items テーブル
| Column | Type   | Options     |
| ------ | ------ | ----------- |
| item_name            | string     | null: false |
| explanation          | text       | null: false |
| category_id          | integer    | null: false |
| condition_item_id    | integer    | null: false |
| delivery_charge_id   | integer    | null: false |
| prefecture_id            | integer    | null: false |
| delivery_day_id      | integer    | null: false |
| price                | integer    | null: false |
| user                 | references | null: false, foreign_key:true |

### Association
- belongs_to :user
- has_many :comments
- has_one :purchase

## comments テーブル
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| comment_text     | string     | null: false |
| user             | references | null: false, foreign_key:true |
| item             | references | null: false, foreign_key:true |

### Association
- belongs_to :item
- belongs_to :user

## purchase テーブル
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user                | references | null: false, foreign_key:true |
| item                | references | null: false, foreign_key:true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :delivery_information

## delivery_informations テーブル
| Column | Type       | Options              |
| ------ | ---------- | -------------------- |
| postal_number       | string     | null: false |
| prefecture_id       | integer    | null: false |
| city                | string     | null: false |
| address             | string     | null: false |
| building_name       | string     |
| telephone_number    | string     | null: false |
| purchase            | references | null: false, foreign_key:true |

### Association
- belongs_to :purchase