# README
フォークのテスト
## informationsテーブル

|Culumn|Type|Option|
|------|----|-------|
|cotent|text|null: fallse|

### Association
- has_many :images
- has_many :informations_categorys
- has_many :categorys, through: informations_categorys


## imagesテーブル

|Culumn|Type|Option|
|------|----|-------|
|url|string|null: fallse|
|information-id|reference|null: fallse, foreign_key: true|

### Association
- belongs_to :information


## categorysテーブル

|Culumn|Type|Option|
|------|----|-------|
|name|string||

### Association
- has_many :informations_categorys
- has_many :informations, through: informations_categorys


## informations_categorysテーブル

|Culumn|Type|Option|
|------|----|-------|
|information-id|reference|null: fallse, foreign_key: true|
|category-id|references|null: fallse, foreign_key: true|

### Association
- belongs_to :information
- belongs_to :category

