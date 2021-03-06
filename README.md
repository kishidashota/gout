# ビール好き専用の飲み屋投稿アプリ 「Gout」
  http://18.178.24.81/

## アプリ概要
  飲み屋の主要ビール銘柄とおすすめメニューを投稿するアプリです。

## 制作経緯
  私がアサヒビールが好きで、お店に入る前にお店ごとの銘柄情報が一目でわかるアプリケーションがあればと思い、作りました。

## 機能一覧
- ユーザー関連
    - アカウント作成・編集機能(登録時に選択した画像をその場で表示/js)
    - ログイン・ログアウト機能
    - プロフィールページ(投稿一覧・いいねした投稿を表示)
    - ユーザー一覧ページ
- 投稿関連
    - 投稿・編集・削除機能(登録時に選択した画像をその場で表示/js)
    - 投稿に対するいいね機能
    - 投稿に対するコメント機能(非同期/js)
    - タグ付け機能
    - 検索機能① インクリメンタルサーチ(js)
    - 検索機能② タグ検索
    - マップ表示(Google Maps API)
    - ページネーション 
    - アラート機能
## 使用画面サンプル
- トップページ(ログイン後)
    - <img src="https://github.com/kishidashota/gout/blob/master/rea1.png" width="600px">

- 新規投稿画面
    - <img src="https://github.com/kishidashota/gout/blob/master/rea2.png" width="600px">
- マイページ
    - <img src="https://github.com/kishidashota/gout/blob/master/rea4.png" width="600px">
- 投稿詳細画面
    - <img src="https://github.com/kishidashota/gout/blob/master/rea5.png" width="600px">
- セレクトタグ検索
    - https://i.gyazo.com/a833290a985fda4e863d1c3323f09d6e.mp4
- インクリメンタルサーチ
    - https://i.gyazo.com/a816b4689f609e79f9d864114059b789.mp4


## 使用技術
- バックエンド
    - Ruby 2.5.1
    - Rails 5.2.4.2
    - MySQL 5.6.46
- フロントエンド
    - haml
    - scss
    - JavaScript
    - JQuery
- インフラストラクチャー
    - 開発環境
        - Docker 19.03.8
        - docker-compose  1.25.4
        - RSpec
    - AWS
        - EC2
        - S3
        - IAM
        - Nginx, unicorn
## 工夫した点
- ユーザーが任意の銘柄を一瞬で選択できる様に、セレクトタグによる検索を可能にしたこと。

- UI/UXを意識して作成した。
    - ベースの色を2色(黒、黄色)にして、ユーザーが見やすくした。
    - インクリメンタルサーチを使い、検索の手軽さを意識した。
    - 選択した箇所を認識してもらうために、:hoverを多用したり、リンクがある場所はデフォルトのcolorから色を変えておく。

## 今後の改善点
- 本番にDockerを導入できていないこと。 (Amazon Linux 2 AMIを使用していなかった為)

    ➡︎ 今後のインフラ構築の際はカリキュラムで学んだ以外のAWSのサービス概要を事前に把握して、VPC, Route 53, ALB, ACM, RDSといったAWSの主要サービスを理解しつつ。その他のインフラの知見も深めていきたいです。

- マップ表示(Google Maps API)のGoogle_API_keyがどうしても取得できないエラーが出てしまうので、丸二日かけたが、解決しなかった。時間がある時に内容理解も含めて解決させたいです。
