class BooksController < ApplicationController
    
    before_action :set_book, only: [:show, :update, :destroy]

    def index 
        books = Book.all 
        render json: books
    end 

    def show 
        if @book
            render json: @book
        else 
            render json: {status: "error", code:3000, message: "This id does not exist" }
        end 
    end 

    def create 
        book = Book.new(book_params)
        if book.save 
            render json: book
        else 
            render json: book.errors 
        end 
    end 

    def update
        if @book.update(book_params)
            render json: @book
        else 
            render json: @book.errors 
        end 
    end 

    def destroy
        @book.destroy
    end 

    private 
    def set_book
        @book = Book.find_by_id(params[:id])
    end 

    def book_params
        params.require(:book).permit(:title, :pages, :chapters, :author_id)
    end 
end