# ruby-on-rails-sample

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
