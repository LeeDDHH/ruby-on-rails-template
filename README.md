# ruby-on-rails-sample

## 動作環境

|         |       |                       |
| :-----: | :---: | :-------------------: |
|  Ruby   | 3.0.2 |    rbenv から追加     |
|  rbenv  | 1.2.0 |     brew から追加     |
| bundler | 2.4.3 | `gem install bundler` |

## 初期設定

```shell
# rbenv install
brew install rbenv ; echo 'eval "$(rbenv init -)"' >> ~/.zshrc
brew upgrade ruby-build

# ruby install
cat .ruby-version | rbenv install
cat .ruby-version | rbenv global
```
