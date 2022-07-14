class BooksController < ApplicationController
  def index_new
    @book = Book.new
    @books = Book.all
  end

  def create
    #データを受け取り新規登録するためのインスタンス作成
    book = Book.new(book_params)
    #データをデータベースに保存するためのsaveメソッド実行
    book.save
    #詳細画面へリダイレクト
    redirect_to "/books/#{book.id}"
  end

  def show

  end

  def edit

  end

  def destroy

  end

  private
  #ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
