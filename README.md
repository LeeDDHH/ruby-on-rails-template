# ruby-on-rails-sample

## 動作環境

|         |        |                                             |
| :-----: | :----: | :-----------------------------------------: |
|  Ruby   | 3.0.2  |               rbenv から追加                |
|  rbenv  | 1.2.0  |                brew から追加                |
|   gem   | 3.2.22 | Ruby がインストールされていれば、入っている |
| bundler | 2.4.3  |            `gem install bundler`            |
|  rails  | 7.0.0  |       `gem install rails -v 7.0.0 -N`       |

## 初期設定

```shell
# rbenv install
brew install rbenv ; echo 'eval "$(rbenv init -)"' >> ~/.zshrc
brew upgrade ruby-build

# ruby install
cat .ruby-version | rbenv install
cat .ruby-version | rbenv global
```
