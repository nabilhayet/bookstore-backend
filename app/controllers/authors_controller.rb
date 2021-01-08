class AuthorsController < ApplicationController

    skip_before_action :verify_authenticity_token
    before_action :set_author, only: [:show, :update, :destroy]

    def index 
        authors = Author.all 
        render json: authors
    end 

    def show 
        if @author
            render json: @author
        else 
            render json: {status: "error", code:3000, message: "This id does not exist" }
        end 
    end 

    def create 
        author = Author.new(author_params)
        
        if author.save 
            render json: author
        else 
            render json: author.errors 
        end 
    end 

    def update
        if @author.update(author_params)
            render json: @author
        else 
            render json: @author.errors 
        end 
    end 

    def destroy
        @author.destroy
    end 

    private 
    def set_author
        @author = Author.find_by_id(params[:id])
    end 

    def author_params
        params.require(:author).permit(:first_name, :last_name, :age, :contact)
    end 
end