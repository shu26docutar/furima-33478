# README

### ユーザー管理機能(user)
|        Column        |   Type  |         Options                      |
| -------------------- | ------- | ------------------------------------ |
| email                | string  | null: false,default: "",unique: true |
| encrypted_password   | string  | null: false,default: ""              |
| first_name           | string  | null: false                          |
| last_name            | string  | null: false                          |
| first_name_kana      | string  | null: false                          |
| last_name_kana       | string  | null: false                          |
| nickname             | string  | null: false                          |

# Association
has_many: items
has_many: purchases


###　商品情報(item)
|     Column      |    Type   |   Options   |
| --------------- | --------- | ----------- |
| title           | string    | null: false |
| description     | text      | null: false |
| category_id     | integer   | null: false |
| status_id       | integer   | null: false |
| item_fee_id     | integer   | null: false |
| shipping_day_id | integer   | null: false |
| shipping_fee_id | integer   | null: false |
| shipping_add_id | integer   | null: false |

# Association
belongs_to: user
has_one: purchase


###　購入記録(purchase)
| Column |   Type    |           Options           |
| ------ | --------- | --------------------------- |
| user   | reference | null:false,foreign_key: tue |
| item   | reference | null:false,foreign_key: tue |

# Association
belongs_to: user
belongs_to: item
has_one: address


###　住所(address)
|     Column      |   Type    |      Options      |
| --------------- | --------- | ----------------- |
| post_num        | string    | null: false       |
| prifecture_id   | integer   | null: false       |
| city    　　     | string    | null: false       |
| street　　       | string    | null: false       |
| street_num　　   | string    | null: false       |
| building_num    | string    |                   |
| street_num      | string    | null: false       |
| tell_num        | string    | null: false       |
| purchase        | reference | foreign_key: true |

# Association
belongs_to: purchase
