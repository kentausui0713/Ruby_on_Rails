class TodolistsController < ApplicationController
  def new
    # (/Todolists/newにアクセスされたら自動生成される)viewに渡すためのインスタンス変数に空のモデルオブジェクトを生成する
    @list = List.new
  end

  def create
    # データを新規登録するためのインスタンス生成
    list = List.new(list_params)
    # データをデータベースに保存するためのsaveメソッド実行
    list.save
    #投稿一覧へリダイレクト
    redirect_to todolist_path(list.id)
  end

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end
  
  def edit
    @list = List.find(params[:id])
  end

  private
  # ストロングパラメータ
  def list_params
    params.require(:list).permit(:title,:body)
  end
end
