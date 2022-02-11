class BooksController < ApplicationController
  def new
    @book=Book.new
  end
  
  def create
    @book=Book.new(book_params)
    if @book.save
     redirect_to book_path(@book.id),notice:'Book was successfully created.'
    else
      render :index
    end  
  end 


  def index
    @books=Book.all
  end
  
  
  def show
    @book=Book.find(params[:id])
  end 
  
  
  def edit
    @book=Book.find(params[:id])
  end
  
  
  def update
    @book=Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path(@book.id),notice:'Book was successfully updated.'
  end 
    
    
  def destroy
    @books=Book.find(params[:id])
    @books.destroy
    redirect_to '/books',notice:'Book was successfully destroyed.
    '
  end 
  
  private
  def book_params
    params.permit(:title,:body)
  end
end