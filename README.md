# README

### ユーザー管理機能(user)
|  Column  |   Type  |   Options   |
| -------- | ------- | ----------- |
| email    | string  | null: false |
| password | string  | null: false |
| name     | string  | null: false |
| nickname | string  | null: false |

# Association
has_many: items
has_many: purchases


###　商品情報(item)
|    Column    |    Type   |           Options           |
| ------------ | --------- | --------------------------- |
| title        | string    | null: false                 |
| description  | test      | null: false                 |
| category     | string    | null: false                 |
| status       | string    | null: false                 |
| item_fee     | integer   | null: false                 |
| shipping_day | integer   | null: false                 |
| shipping_fee | integer   | null: false                 |
| purchase     | reference | null:false,foreign_key: tue |


# Association
belongs_to: user
has_one: purchase


###　購入記録(purchase)
|   Column    |   Type    |           Options           |
| ----------- | --------- | --------------------------- |
| who         | integer   | null: false                 |
| when        | integer   | null: false                 |
| tell_number | integer   | null: false                 |
| address     | reference | null:false,foreign_key: tue |

# Association
belongs_to: user
belongs_to: item
has_one: purchase


###　住所(address)
|    Column      |   Type    |           Options           |
| -------------- | --------- | --------------------------- |
| post_num       | integer   | null: false                 |
| prifecture     | string    | null: false                 |
| municipaliteis | string    | null: false                 |
| street_num     | integer   | null: false                 |

# Association
belongs_to: purchase
