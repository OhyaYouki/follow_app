# README

## DB 設計

## users table

| Column             | Type                | Options                                       |
| ------------------ | ------------------- | --------------------------------------------- |
| nickname           | string              | null: false                                   |
| email              | devise のデフォルト   | null: false                                   |
| encrypted_password | devise のデフォルト   | null: false                                   |

### Association

* has_many :posts

* has_many :relationships                                            , foreign_key: "user_id"
* has_many :followings           , through: :relationships           , source: :following

* has_many :passive_relationships, class_name: "Relationship"        , foreign_key: 'following_id'
* has_many :followers            , through: :passive_relationships   , source: :user



## posts table

| Column              | Type               | Options                                       |
| ------------------- | ------------------ | --------------------------------------------- |
| content             | string             | null: false                                   |
| user                | references         | null: false,foreign_key: true                 |

### Association

* belongs_to :user


## relationships table

| Column              | Type               | Options                                       |
| ------------------- | ------------------ | --------------------------------------------- |
| user                | references         | null: false,foreign_key: true                 |
| following           | references         | null: false,foreign_key: { to_table: :users } |

### Association

* belongs_to :user
* belongs_to :following, class_name: 'User'

## 備考
