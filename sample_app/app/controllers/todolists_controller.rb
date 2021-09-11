class TodolistsController < ApplicationController
  def new
    # (/Todolists/newにアクセスされたら自動生成される)viewに渡すためのインスタンス変数に空のモデルオブジェクトを生成する
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    # if文を使ってバリデーション設定を使う(trueかfalseかで遷移する場所が違う)
    if @list.save
      redirect_to todolist_path(@list.id)
    else
      render :new
    end
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

  def update
    list = List.find(params[:id])
    list.update(list_params)
    redirect_to todolist_path(list.id)
  end

  private
  # ストロングパラメータ
  def list_params
    params.require(:list).permit(:title,:body,:image)
  end
end
