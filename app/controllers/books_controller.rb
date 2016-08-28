class BooksController < ApplicationController
  before_action :find_book, only: [:show, :edit, :update, :destroy]
  before_action :require_user, only: [:index, :show]
  
  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

 def create
 end
 
  def show
  end
  
  def destroy
        @book.destroy
        redirect_to root_path
  end
    
  private
  def book_params
    params.require(:book).permit(:title, :author, :description)
  end
  
  def find_book
    @book = Book.find(params[:id])
  end
end
