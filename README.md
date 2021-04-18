# README
# 本番環境(デプロイ先テストアカウント＆ID)
  ○接続先： https://sheltered-thicket-83138.herokuapp.com/ <br>
  ○認証ID/Pass:  admin / 2222<br>
  
# DB設計

## categoriesテーブル
| Column | Type     | Options                       |
|--------|----------| ------------------------------|
| name   | string   | null: false, uniqueness: true |


### Association
- has_many :ideas

## ideasテーブル
| Column       | Type       | Options                        |
|--------------|------------|--------------------------------|
| category     | references | null: false, foreign_key: true |
| body         | text       | null: false                    |

### Association
- belongs_to :category
