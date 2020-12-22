# README

# テーブル設計

## users Table

| Column          | Type    | Options                                |
| --------------- | ------- | -------------------------------------- |
| nickname        | string  | null: false                            |
| password        | string  | null: false                            |
| email           | string  | null: false, unique: true, index: true |
| first_name      | string  | null: false                            |
| last_name       | string  | null: false                            |
| first_name_kana | string  | null: false                            |
| last_name_kana  | string  | null: false                            |
| birth_year      | integer | null: false                            |
| birth_month     | integer | null: false                            |
| birth_day       | integer | null: false                            |

### Associations
-has_many: comments, dependent: :destroy
-has_many: items
-has_many: credit_cards
-has_many: purchases


## items Table

| Column          | Type       | Options                                |
| --------------- | ---------- | -------------------------------------- |
| name            | string     | null: false                            |
| price           | integer    | null: false                            |
| description     | text       | null: false                            |
| user            | references | null: false, foreign_key: true         |
| category        | references | null: false, foreign_key: true         |
| condition       | references | null: false, foreign_key: true         |
| size            | references | null: false, foreign_key: true         |

### Associations
-belongs_to: user
-has_one: purchase
-has_many: deliveries
-belongs_to_active_hash: category
-belongs_to_active_hash: condition
-belongs_to_active_hash: size

## purchases Table
| Column          | Type       | Options                                |
| --------------- | ---------- | -------------------------------------- |
| user            | references | null: false, foreign_key: false        |
| item            | references | null: false, foreign_key: false        |

### Associations
-has_one: credit_card
-has_one: shipping
-has_one: delivery
-belongs_to: user
-belongs_to: item

## deliveries Table
| Column          | Type       | Options                                |
| --------------- | ---------- | -------------------------------------- |
| shipping_cost   | integer    | null: false                            |
| area            | string     | null: false                            |
| time_to_ship    | integer    | null: false                            |
| item            | references | null: false, foreign_key: true         |

### Associations
-belongs_to: item

## credit_cards Table
| Column           | Type       | Options                                |
| ---------------- | ---------- | -------------------------------------- |
| card_number      | integer    | null: false                            |
| expiration_month | integer    | null: false                            |
| expiration_year  | integer    | null: false                            |
| security_code    | integer    | null: false                            |
| user             | references | null: false, foreign_key: true         |

### Associations
-belongs_to: user

## shippings Table
| Column          | Type       | Options                                |
| --------------- | ---------- | -------------------------------------- |
| postal_code     | integer(7) | null: false                            |
| prefecture      | string     | null: false                            |
| city            | string     | null: false                            |
| house_number    | string     | null: false                            |
| building_name   | string     | null: false                            |
| phone_number    | integer    | null: false                            |
| user            | references | null: false, foreign_key: true         |
| purchase        | references | null: false, foreign_key: true         |

### Associations
-belongs_to: user
-belongs_to: purchase

## comments Table
| Column          | Type       | Options                                |
| --------------- | ---------- | -------------------------------------- |
| user            | references | null: false, foreign_key: true         |
| item            | references | null: false, foreign_key: true         |
| comment         | text       | null: false                            |

### Associations
-belongs_to: user
-belongs_to: item