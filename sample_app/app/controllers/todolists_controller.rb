class TodolistsController < ApplicationController
  def new
    # viewに渡すためのインスタンス変数に空のモデルオブジェクトを生成する
    @list = List.new
  end
end
