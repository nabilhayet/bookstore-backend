![GitHub Repo stars](https://img.shields.io/github/stars/nabilhayet/Restaurant) ![GitHub forks](https://img.shields.io/github/forks/nabilhayet/Restaurant) ![GitHub followers](https://img.shields.io/github/followers/nabilhayet) ![Bitbucket open issues](https://img.shields.io/bitbucket/issues/nabilhayet/Restaurant)                                          
                                        <h1>:bomb: BookStore-Backend :bomb: </h1>
                                                      
This project lets a user add a new book or author. After creating, a user can see all the existing authors or books. After clicking on a link, the details of an author/book can be viewed. Updating or deleting an author/book option available to the user.

<a href="https://www.youtube.com/watch?v=54azoDzOMTc&t=1s">Demo</a>
<a href="https://github.com/nabilhayet/bookstore-frontend">Frontend</a>

Table of Contents
- [Features](#features)
- [Tech-Stack](#tech-stack)
- [Installing](#installing)
- [Challenges](#challenges)
- [Future-Implementation](#future-implementation)
- [Code-Snippet](#code-snippet)
                               
## Features
<ul>
 <li>Full CRUD capabilities for authors such as</li>
 <li>Add a new author</li>
 <li>View all existing authors on this application</li>
 <li>Edit/Delete the authors</li>
 <li>Full CRUD capabilities for books such as</li>
 <li>Add a new book</li>
 <li>View all existing books on this application</li>
 <li>Edit/Delete the books added</li>
</ul>

## Signup 

![dem](https://user-images.githubusercontent.com/33500404/109376302-97f5ee00-7891-11eb-89aa-6fdfd054c8c9.gif)

## Tech-Stack
<p>This web app makes use of the following:</p>

* ruby '2.6.1'
* rails, '~> 6.0.3', '>= 6.0.3.4'
* sqlite3, '~> 1.4'
* puma, '~> 4.1'
* sass-rails, '>= 6'
* webpacker, '~> 4.0'
* rack-cors
* pry
* active_model_serializers, '~> 0.10.0'


## Installing
<ul>
<li> Clone this repo to your local machine git clone <this-repo-url></li>
<li> run bundle install to install required dependencies</li>
<li> run rails db:create to create a database locally.</li>
<li> run rails db:migrate to create tables into the database.</li>
<li> run rails db:seed to create seed data.</li>
<li> run rails s to run the server.</li>
</ul>
        
## Challenges
<ul>
<li> The serializer wasn't working properly to filter out json data</li>
<li> I didn't know how to display error message on the DOM</li>
<li> It took me a while to figure out the params</li>
</ul>

## Future-Implementation
<ul>
<li> Refactor APIs and data relationships</li>
<li> Deployment to production server</li>
</ul> 

## Code-Snippet 

```
class Author < ApplicationRecord	
 has_many :books
	
 validates :first_name, presence: true
 validates :last_name, presence: true
 validates :age, presence: true
 validates :contact, presence: true
 validates :age, numericality: { only_integer: true }
 validates :contact, numericality: { only_integer: true }
end
```

```
class AuthorSerializer < ActiveModel::Serializer	
 attributes :id, :first_name, :last_name, :age, :contact
 has_many :books
end
```

```
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
 ```
 
 ```
 private	
  def set_author
   @author = Author.find_by_id(params[:id])
  end
	
  def author_params
   params.require(:author).permit(:first_name, :last_name, :age, :contact)
  end
 end
```
