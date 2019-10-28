# README
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false,unique: true|
|nickname|string|null: false,unique: true|
|email|string|null: false|
|region|string|null: false|
|adress|string|null: false|
|birthday|date|null: false|
|shipping_date|string|null: true|

### Association
- has_many :credits
- has_many :products
- has_many :user_ratings
- has_many :favorites

## creditsテーブル
|Column|Type|Options|
|------|----|-------|
|number|integer|null :false|
|expiration_date|date|null :false|
|security_code|integer|null :false|

### Association
belongs_to :user

## user_ratingsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false|
|rating|integer|null: true|
<!-- raiting 0 => bad ,1 => soso, 2 => good -->

### Association
belongs_to :user

## favoritesテーブル
|Column|Type|Options|
|------|----|-------|
|product_id|integer|null: false|
|user_id|integer|null: false|

### Association
has_many :users
has_many :products

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|comment|text|null: false|
|user_id|integer|null: false, foreign_key: true|
|product_id|integer|null: false, foreign_key: true|

### Association
belongs_to :users
belongs_to :product

## productsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|image|text|null: false|
|price|integer|null: false|
|size|integer|null: false|
|condition|string|null: false|
|delivery_fee_pay|string|null: false|
|delivery_method|string|null: false|
|region|string|null: false|
|delivery_date|integer|null: false|
|explanation|text|null: false|
|buyer_id|integer|null: true|
|seller_id|integer|null: true|
|bland_id|integer|null: false|
|category_id|integer|null: false|


### Association
belongs_to :buyer_id , class_name: "User"
belongs_to :seller_id , class_name: "User"
belongs_to :bland
belongs_to :category

## blandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
has_many :products

## categorysテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
has_many :products
