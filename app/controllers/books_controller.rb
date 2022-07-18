class BooksController < ApplicationController
  def index
    @book = Book.new
    @books = Book.all
  end

  def create
    #データを受け取り新規登録するためのインスタンス作成
    @book = Book.new(book_params)
    #データをデータベースに保存するためのsaveメソッド実行
    if @book.save
      redirect_to "/books/#{@book.id}", notice: "Book was successfully created."
    else
      @books = Book.all
      render :index
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    #データを受け取り新規登録するためのインスタンス作成
    @book = Book.find(params[:id])
    #データをデータベースに保存するためのsaveメソッド実行
    if @book.update(book_params)
    #詳細画面へリダイレクト
      redirect_to "/books/#{@book.id}", notice: "Book was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])  # データ（レコード）を1件取得
    book.destroy  # データ（レコード）を削除
    redirect_to '/books'  # 投稿一覧画面へリダイレクト
  end

  private
  #ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
