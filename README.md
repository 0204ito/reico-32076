reico (レイコ)
====
家族でシェアできる冷蔵庫管理システムです。

![reico_表紙](https://user-images.githubusercontent.com/73625783/102702266-569afe00-42a4-11eb-8846-c15af0b79f02.png)

## Description
<dt>グループで冷蔵庫をシェアし、食材を追加、編集、削除で管理できます。</dt>
<dt>検索、並び替え機能で希望の食材情報が探せます。</dt>
<dt>グループでチャットができるので、お使いを頼んだり、夕飯をリクエストするなどの交流ができます。</dt>

仕事先、外出先でも食材が把握でき、買い物リストや夕飯の献立を考えるのにも便利です！

___
## Feature

* 食材追加が、非同期で行えるためレシートを見ながらまとめて記入できます。
* 食材をクリックすることで打ち消し線が現れるため、消費済みの食材に簡単にチェックが入れられます。<dt>（DBから削除せずに残して置くことで、お気に入りの食材を購入する際などの情報となります）</dt>
* グループで冷蔵庫をシェアし、食材を追加、編集、削除で管理できます。
* 検索、並び替え機能で希望の食材情報が探せます。
* グループでチャットができるので、お使いを頼んだり、夕飯をリクエストするなどの交流ができます。
* レスポンシブウェブデザインになっているので、自宅のPCでも、スマートフォンでも操作が行えます。
___
## URL 
http://54.150.8.150/

Basic認証
* ユーザー名 : ito
* パスワード : 0204

ログイン情報（テスト用）
* email : a@a
* password : a111111
___
## Production background
* 仕事帰りや、出先で買い物する際、買うべきものを把握できてないために買い忘れが起こる
* 冷蔵庫の食材の賞味期限が把握できていないため、食品ロスが起こる
* 冷蔵庫の食材を把握できれば、その中で献立を考えることができる
* 家族で冷蔵庫の中身が確認できていれば、買い物の重複がなくなる
* 家族で冷蔵庫の中身が確認できていれば、お買い物を頼んだり、夕飯のリクエストができる

上記の課題解決を目指し、仕事と家事の両立に忙しい、30~40代の主婦をターゲットに、簡単でわかりやすい機能であることを心がけ制作ました。
___
## Demo
### 〔 トップページ 〕
![reicoトップページ](https://user-images.githubusercontent.com/73625783/102703419-d8ddef00-42b1-11eb-8e21-78393423a874.png)
* トップページ画面 [新規登録] [ログイン] ボタンからユーザー登録できます。
* [ログイン] 後は新規登録が [My home] ボタンへ変わります。
* [New my reico] ボタンから新しい冷蔵庫が作成できます。
* [My home] ボタンから個人ページへ遷移します。

### 〔 個人ページ 〕
![reico個人ページ](https://user-images.githubusercontent.com/73625783/102703531-53f3d500-42b3-11eb-8be0-3283f719d464.png)
* 個人ページ左にはグループに参加している [冷蔵庫名] ボタンが一覧表示されます。
* [冷蔵庫名] をクリックすると食材一覧画面が開きます。

### 〔 食材一覧ページ 〕
![reico食材一覧](https://user-images.githubusercontent.com/73625783/102703660-15f7b080-42b5-11eb-86af-4179247b9c28.png)
* 食材名をクリックすると、打ち消し線と文字の色が変わります。（消費済み食材にチェックがつけられます）
* 食材一覧ページ上 [食材の追加] ボタンから食材追加ページへ遷移します。
* 食材一覧ページ上 [検索・編集] ボタンから食材検索・編集ページへ遷移します。
* 食材一覧ページ上 [リクエスト] ボタンからチャットページへ遷移します。

### 〔 食材追加ページ 〕
![reico食材追加](https://user-images.githubusercontent.com/73625783/102703757-455aed00-42b6-11eb-9728-e1e6a143223b.png)

* [食材を追加] ボタンで非同期で食材を追加できます。追加された食材はページ下に表示されます。
* 追加が終了したら[my reico] ボタンで食材一覧画面に戻ります。
### 〔 食材検索・編集ページ 〕
![reico検索・編集](https://user-images.githubusercontent.com/73625783/102703911-8ce27880-42b8-11eb-84f7-669b9e3b4015.png)
* 検索フォームに入力し [検索] ボタンをクリックすると食材の中からキーワード検索できます。
* 右 [カテゴリー] [並び替え] ボタンから、カテゴリー別、賞味期限が近いもの順、在庫食材のみ、などに絞って表示できます。
* 食材右 [Edit] ボタンから、食材１品目ごとの編集・削除画面に遷移します。
* 検索や編集が終了したら[my reico] ボタンで食材一覧画面に戻ります。
### 〔 リクエストページ 〕
![reicoリクエスト](https://user-images.githubusercontent.com/73625783/102704093-66bdd800-42ba-11eb-8ca0-86b79ac3386f.png)
* 冷蔵庫を共有しているメンバーでチャットができます。
* 最新コメントが一番上に表示され、投稿者の名前と日時も表示されます。
___
## Requirement
バックエンド : Ruby , Ruby on Rails

フロントエンド : HTML , CSS , JavaScript , Ajax

データベース : MySQL

インフラ : AWS(EC2) , Capistrano

Webサーバー(本番環境) : Nginx

アプリケーションサーバー : Unicorn

ソース管理 : GitHub , GitHub Desktop

テスト : RSpec

エディタ : VSCode

___
## Future tasks
* 結合テストが未完成です。個人アプリの担保のためにしっかりと実装したいです。
* 食材情報として、数量、評価★を追加したいです。
* エラー文を日本語表示にしたいです。
* 賞味期限が3日以内の食材が赤く表示されるような機能をつけたいです。

___
## DB 

### 〔 users テーブル 〕

|        Column      |  Type  | Options      |
| ------------------ | ------ | ------------ |
|       nickname     | string | unique: true |
|        email       | string | unique: true |
| encrypted_password | string | unique: true |

### Association
<dt>has_many : refriges , through: :refriges_users</dt>
<dt>has_many : refriges_users</dt>
<dt>has_one : comments</dt>



### 〔 refriges_users テーブル 〕

| Column |    Type    | Options                        |
| ------ | ---------- | ------------------------------ |
|  user  | references | null: false, foreign_key: true |
|refrige | references | null: false, foreign_key: true |

### Association
<dt>belongs_to :refrige</dt>
<dt>belongs_to :user</dt>

### 〔 refriges テーブル 〕

|       Column     |   Type   | Options      |
| ---------------- | -------- | ------------ |
|   refrige_name   |  string  | unique: true |

### Association
<dt>has_many :users, through: :refrige_users</dt>
<dt>has_many :refrige_users</dt>
<dt>has_many :foods</dt>
<dt>has_many :comments</dt>


### 〔 foods テーブル 〕

|    Column   |    Type    | Options                        |
| ----------- | ---------- | ------------------------------ |
|  food_name  |   string   | null: false                    |
|product_name |   string   |                                |
| category_id |   integer  | null: false                    |
|purchase_date|    date    | null: false                    |
|   sell_by   |    date    | null: false                    |
|     shop    |   string   |                                |
|   checked   |   boolean  |                                |
|   refrige   | references | null: false, foreign_key: true |

### Association
<dt>belongs_to :refrige</dt>


### 〔 comments テーブル 〕

| Column |    Type    | Options                        |
| ------ | ---------- | ------------------------------ |
|  text  |    text    | null: false                    |
|  user  | references | null: false, foreign_key: true |
|refrige | references | null: false, foreign_key: true |

### Association
<dt>belongs_to :user</dt>
<dt>belongs_to :refriges</dt>
