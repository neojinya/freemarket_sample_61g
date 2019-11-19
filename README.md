# README
## usersテーブル
|Column|Type|Options|説明|
|------|----|-------|----|
|first_name|string|null: false||
|last_name|string|null: false||
|first_name_kata|string|null: false||
|last_name_kata|string|null: false||
|nickname|string|null: false,unique: true||
|image|text|||
|profiel_message|text||プロフィールメッセージ|
|num_of_exihibits|integer|null:false|出品数|
|phone_number|string|null:false||
|email|string|null: false||
|post_code|string|null: false|郵便番号|
|prefecture|string|null: false|都道府県|
|city_village_town|string|null: false||
|house_number|string|null: false|番地|
|building|string||建物|
|birthday|date|null: false||

### Association
- has_many :products
- has_many :cards


## cardsテーブル
|Column|Type|Options|説明|
|------|----|-------|----|
|customer_i|integer|null :false||
|card_id|date|null :false|有効期限|
|user_id|integer|foreign_key: true||

### Association
- belongs_to :user

## productsテーブル
|Column|Type|Options|説明|
|------|----|-------|----|
|name|string|null: false||
|price|integer|null: false||
|condition|string|null: false||
|delivery_fee_pay|integer||配送費用の支払い方法|
|region|string|||
|delivery_date|integer|||
|explanation|text||商品説明|
|buyer_id|integer|foreign_key: true||
|seller_id|integer|foreign_key: true,null:false||
|bland_id|integer|foreign_key: true||
|category_id|integer|foreign_key: true||

### Association
- belongs_to :buyer_id , class_name: "User" ,optional: true
- belongs_to :seller_id , class_name: "User"
- belongs_to :category
- accepts_nested_attributes_for :images

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|category_id|integer|null: false|

### Association
- has_many :products
- has_ancestry

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|text|null: false, index: true|
|product_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :product, optional: true
- mount_uploaders :image, ImageUploader

