class BooksController < ApplicationController
  def index
    @book = Book.new
    @books = Book.all
  end

  def create
    @books = Book.all
    @book = Book.new(book_params)
    if @book.save
      # リダイレクトと同時に'Book was successfully created.'を表示
      # flash単体の場合：flash[:notice] = 'Book was successfully created.'

      # redirect_toに合わせて記載の場合
      redirect_to book_path(@book.id), notice: 'Book was successfully created.'
    else
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
    @book = Book.find(params[:id])
    if @book.update(book_params)
      # リダイレクトと同時に'Book was successfully created.'を表示
      redirect_to book_path(@book.id), notice: 'Book was successfully created.'
    else
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
