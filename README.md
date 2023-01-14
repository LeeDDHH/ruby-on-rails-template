# ruby-on-rails-sample

## 動作環境

|         |        |                                             |
| :-----: | :----: | :-----------------------------------------: |
|  Ruby   | 3.0.2  |               rbenv から追加                |
|  rbenv  | 1.2.0  |                brew から追加                |
|   gem   | 3.2.22 | Ruby がインストールされていれば、入っている |
| bundler | 2.4.3  |            `gem install bundler`            |
|  rails  | 7.0.0  |                                             |

### 開発環境

|                |          |
| :------------: | :------: |
|     docker     | 20.10.22 |
| docker-compose |  2.15.1  |

### デフォルト設定

- API サーバー
  - `http://localhost:3000/`

## ディレクトリ構成

- [フォルダ構造 | Rails ドキュメント](https://railsdoc.com/page/folder_structure)

```markdown
.
├── Dockerfile （サーバーのベースが記載されたファイル
├── Gemfile （Rails で扱うパッケージの依存関係を指定したファイル
├── Gemfile.lock （Gemfile から実際にインストールされた Gem の一覧とバージョン
├── README.md （プロジェクトの説明
├── Rakefile （Ruby のビルドツール（Rake）用のファイル
├── app （アプリケーション用のディレクトリ
│   ├── assets （アプリケーション用のリソースを置くディレクトリ
│   │   ├── config （環境に関するものを管理するファイル用のディレクトリ
│   │   ├── images （画像用のディレクトリ
│   │   └── stylesheets （公開するスタイルシート用のディレクトリ
│   ├── channels （Action Cable ファイル用のディレクトリ
│   ├── controllers （コントローラ用のディレクトリ
│   ├── helpers （ヘルパー用のディレクトリ
│   ├── javascript （JavaScript 関連のスクリプト用のディレクトリ
│   ├── jobs （Active Job 用のディレクトリ
│   ├── mailers （Action Mailer ファイル用のディレクトリ
│   ├── models （モデル用のディレクトリ
│   └── views （ビュー用のディレクトリ
│   　　 └── layouts （ビューのレイアウト用の RHTML テンプレート用のディレクトリ
├── bin （アプリケションを管理する様々なスクリプト用のディレクトリ
├── config （アプリケーションの設定ファイル用のディレクトリ
│   ├── environments （環境単位の設定ファイル用のディレクトリ
│   ├── initializers （初期化ファイル用のディレクトリ
│   └── locales （辞書ファイル用のディレクトリ
├── config.ru （Rack 用のファイル
├── db （データベース関連のファイル用のディレクトリ
├── docker-compose.yml （サーバー起動用ファイル
├── lib （複数のアプリケーション間で共有するライブラリ用のディレクトリ
│   ├── assets （自分で生成したライブラリ用のディレクトリ
│   └── tasks （自分で生成した Rakefile 用のディレクトリ
├── log （ログファイル用のディレクトリ
├── public （Web 上に公開するファイル用のディレクトリ
├── storage （ファイルのアップロードで保存されるディレクトリ
├── test （アプリケーションのテストに使うファイル用のディレクトリ
├── tmp （一時ファイル用のディレクトリ
└── vendor （外部ライブラリ用のディレクトリ
```

## 初期設定

```shell
# rbenv install
brew install rbenv ; echo 'eval "$(rbenv init -)"' >> ~/.zshrc
brew upgrade ruby-build

# ruby install
cat .ruby-version | rbenv install
cat .ruby-version | rbenv global

# dockerでプロジェクトを立ち上げて、コンテナ内でやること
rails db:create
rails db:migrate
rails db:seed
```

## プロジェクト作成時のコマンド

- rails プロジェクト作成時に行ったコマンド
  - `docker compose run サービス名 コマンド`

```shell
docker-compose run web rails new .
```

## コマンド

### サーバーイメージのビルド

- ビルドが必要なとき
  - 新たな Gemfile が作成される
  - Gemdfile が更新される
  - Dockerfile が修正される
- ビルドし直す必要がある場合、docker で生成した以下の要素を削除してから行う
  - docker コンテナ
  - docker イメージ

```shell
docker compose build
```

### サーバー立ち上げ

```shell
docker compose up -d
```

### サーバー停止

```shell
docker compose stop
```

### サーバーコンテナに入る

```shell
docker exec -it コンテナ名 bash
```

## Rails コマンド

- コンテナの中に入って実行する

### コントローラーを生成する

- コントローラー名
  - 名前は複数形にするのが一般的
  - DB と直接紐付かない場合は単数形
  - クラス名にも使われる
- メソッド名
  - ルーティングによって指定される名前としてのインックスアクション

```shell
rails generate controller コントローラー名 コントローラー内で定義するメソッド名

# 簡略
rails g controller コントローラー名 コントローラー内で定義するメソッド名
```

### モデルを生成する

- モデル名
  - 単数形
  - 最初の文字は大文字
- DB 構造
  - `カラム名:型` という形式で複数の値をスペース区切りにして指定する

```shell
rails g model モデル名 DB構造

# 簡略
rails g model モデル名 DB構造
```

### アクションと URL パスの対応表を確認する

- 表示例
  | Prefix | Verb | URI Pattern | Controller#Action |
  | :---------: | :--: | :--------------------: | :---------------: |
  | users_index | GET | /users/index(.:format) | users#index |
  - Prefix
    - リンクを設置する際、パスを指定するときに使う
    - `Prefix名_path` 、 `Prefix名_url` が追加される
  - Verb
    - HTTP メソッド
  - URI Pattern
    - ルーティングで待ち受けるパス
    - `.:format` は必須ではないパラメータ
  - Controller#Action
    - `コントローラー名#メソッド名` の処理が実行される

```shell
rails routes
```

- ルーティングの設定をするファイル
  - `config/routes.rb`

### DB 環境を設定する

- 以下のときにコマンドを実行する
  - プロジェクト初回の設定
  - DB の初期化
  - DB の作り直し

```shell
rails db:create
```

### マイグレーションを実行する

- `db/migrate` にマイグレーション用のファイルがあることを確認してから実行する

```shell
rails db:migrate
```

### データベースの構造を確認する

- DB をコマンドで操作できる

```shell
rails dbconsole
```

### コンソールを立ち上げる

```shell
rails console

# 簡略
rails c
```

## トラブルシューティング

- Docker コンテナー内で rails 関連のコマンドが打てない場合
  - `Gemfile.lock` に使用するプラットフォームの更新がかかっていないか確認する
