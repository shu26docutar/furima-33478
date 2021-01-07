# README

### ユーザー管理機能(user)
|        Column        |   Type  |         Options         |
| -------------------- | ------- | ----------------------- |
| email                | string  | null: false,default: "" |
| encrypted_password   | string  | null: false,default: "" |
| first_name           | string  | null: false             |
| last_name            | string  | null: false             |
| first_name_kana      | string  | null: false             |
| last_name_kana       | string  | null: false             |
| nickname             | string  | null: false             |

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
| item_fee        | integer   | null: false |
| shipping_day_id | integer   | null: false |
| shipping_fee_id | integer   | null: false |

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
has_one: purchase


###　住所(address)
|     Column      |   Type    |   Options   |
| --------------- | --------- | ----------- |
| post_num_id     | integer   | null: false |
| prifecture_id   | integer   | null: false |
| city_id         | integer   | null: false |
| street_id       | integer   | null: false |
| street_num_id   | integer   | null: false |
| building_num_id | integer   | null: false |
| street_num      | integer   | null: false |
| tell_num        | integer   | null: false |

# Association
belongs_to: purchase
