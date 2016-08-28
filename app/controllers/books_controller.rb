class BooksController < ApplicationController
  before_action :find_book, only: [:show, :edit, :update, :destroy]
  before_action :require_user, only: [:show, :edit, :update, :destroy]
  before_action :require_editor, only: [:show, :edit]
  before_action :require_admin, only: [:create, :edit, :update, :destroy]
  
  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

 def create
    @book = Book.new(book_params)
    
    if @book.save
      redirect_to @book
    else
      render 'new'
    end
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
