class BooksController < ApplicationController
  def new
    @Book = Book.new
  end

  def create
    book = Book.new(book_params)
    book.save
    flash[:notice] = "Book was successfully created."
    redirect_to book_path(book.id)

  def index
    @books = book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end
  
   def destroy
    book = book.find(params[:id])  # データ（レコード）を1件取得
    book.destroy  # データ（レコード）を削除
    redirect_to '/books'  # 投稿一覧画面へリダイレクト
  end

  
  private
  
  def book_params
    params.require(:book).permit(:title, :body)
end
