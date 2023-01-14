class UsersController < ApplicationController
  def index
    # viewでも使えるようにインスタンス変数として定義
    @num = 10 + 1
  end
end
