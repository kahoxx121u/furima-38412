# テーブル設計

## users テーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| name_kanji         | string | null: false |
| name_kana          | string | null: false |
| date_of_birth      | string | null: false |

### Association
- has_many :items
- has_many :comments
- has_many :purchases

## items テーブル
| Column | Type   | Options     |
| ------ | ------ | ----------- |
| item_image        | string     | null: false |
| item_name         | string     | null: false |
| explanation       | string     | null: false |
| category          | string     | null: false |
| condition_item    | string     | null: false |
| delivery_charge   | string     | null: false |
| region            | string     | null: false |
| delivery_days     | string     | null: false |
| price             | string     | null: false |
| user              | references | null: false, foreign_key:true |

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

## delivery_information テーブル
| Column | Type       | Options              |
| ------ | ---------- | -------------------- |
| postal_number       | string | null: false |
| prefectures         | string | null: false |
| city                | string | null: false |
| address             | string | null: false |
| building_name       | string |
| telephone_number    | string | null: false |

### Association
- belongs_to :purchase