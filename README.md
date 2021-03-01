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

* react: "^17.0.1",	
*	react-dom: "^17.0.1",
*	react-redux: "^7.2.2",
*	react-router-dom: "^5.2.0",
*	react-scripts: "4.0.1",
*	redux: "^4.0.5",
*	redux-thunk: "^2.3.0",


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
<li> Implementing redux state with react</li>
<li> Whenever an item was deleted the page wasn't updated automatically</li>
<li> Accessing the id of an item inside nested url</li>
<li> Creating the dropdown menu in book component</li>
</ul>

## Future-Implementation
<ul>
<li> Add bootstrap to make the UI more appealing</li>
<li> Insert image for each book</li>
<li> Add more classes like Genre</li>
</ul> 

## Code-Snippet 

```
class CreateAuthor extends Component {
 constructor(){
  super()
  this.state = {
   firstname: "",
   lastname: "",
   age: "",
   contact: "",
   submittedData: [],
   gotAuthor: false,
   id: ""
  }
 }
 
 handleChange = event => {
  this.setState({
   [event.target.id]: event.target.value
  })
 }
 
 handleSubmit =(event) => {
  event.preventDefault()
  const author = {first_name: this.state.firstname, last_name: this.state.lastname, age: this.state.age, contact: this.state.contact}
  this.createNewAuthor(author)
 }
```

```
 createNewAuthor = (author) => {
  const configobj = {
   method: 'POST',
   body: JSON.stringify(author),
   headers: {
    'Content-Type': 'application/json',
    'Accept': 'application/json'
   }
  }
  fetch('http://localhost:3000/authors',configobj)
  .then(response => response.json())
  .then(author => { 
    this.props.addAuthor(author)
    this.setState({
     gotAuthor: true,
     id: author.id 
    })
  })
}
```

```
render() {
 return(
  <div>
   <form onSubmit={event => this.handleSubmit(event)}>
   <p>
    <label>First Name</label>
    <input type="text" id="firstname" onChange={event => this.handleChange(event)} value={this.state.firstname} required/>
   </p>
   <p>
    <label>Last Name</label>
    <input type="text" id="lastname" onChange={event => this.handleChange(event)} value={this.state.lastname} required/>
   </p>
   {this.state.gotAuthor && (<Redirect to={`/authors/${this.state.id}`}/>)}
 </div>
 );
}
```

```
const mapDispatchToProps = dispatch => {
 return {
  addAuthor: author => { dispatch(addAuthor(author)) }
 }
}
export default connect(null, mapDispatchToProps)(CreateAuthor);
```













# BookStore-Backend


1. Project title : The name of this project is Book Store. This project lets a user to add a new book or author. After creating, a user can see all the existing authors or books. After clicking on a link, the details of an author/book can be viewed. Updating or deleting an author/book option available to the user.

2. Motivation : This project was created to provide a platform which will allow the user to add an author/book in a single website. Instead of creating two separate application for both, i decided to build something that would connect the both classes.

3. Tech/framework used Built with 1.React 2.HTML 3.CSS 4.JS 5.SQL

4. Features --A user can add an author. --A user can view all the authors. --Display details of an author. --A user can add a book. --A user can view all the books. --Display details of one book. Search for a particular book using search box. --Update an author/book from the existing ones. --Delete an author/book.

5. For this project, activerecord, active_model_serializers, puma, sqlite3, rake, rack-cors, byebug, listen, spring-watcher-listen gems were used.

6. Code Snippet :

class CreateAuthor extends Component {
  constructor(){
    super()
    this.state = {
      firstname: "",
      lastname: "",
      age: "",
      contact: "",
      submittedData: [],
      gotAuthor: false,
      id: ""
    }

  }
  handleChange = event => {
    this.setState({
      [event.target.id]: event.target.value
    })
  }
  handleSubmit =(event) => {
    event.preventDefault()
    const author = {first_name: this.state.firstname, last_name: this.state.lastname, age: this.state.age, contact: this.state.contact}
    this.createNewAuthor(author)
  }
  createNewAuthor = (author) => {
    const configobj = {
      method: 'POST',
      body: JSON.stringify(author),
      headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json'
      }
    }
    fetch('http://localhost:3000/authors',configobj)
    .then(response => response.json())
    .then(author => { 
      this.props.addAuthor(author)
      this.setState({
        gotAuthor: true,
        id: author.id 
      })
     
    })
  }
render() {
    return(
      <div>
        <form onSubmit={event => this.handleSubmit(event)}>
          <p>
            <label>First Name</label>
            <input type="text" id="firstname" onChange={event => this.handleChange(event)}
            value={this.state.firstname} required/>
          </p>
          <p>
            <label>Last Name</label>
            <input type="text" id="lastname" onChange={event => this.handleChange(event)}
            value={this.state.lastname} required/>
          </p>
            {this.state.gotAuthor && (
          <Redirect to={`/authors/${this.state.id}`}/>
        )}
      </div>
    );
  }
  const mapDispatchToProps = dispatch => {
  return {
      addAuthor: author => { dispatch(addAuthor(author)) }
    }
}
export default connect(null, mapDispatchToProps)(CreateAuthor);

  def create 
        author = Author.new(author_params)
        
        if author.save 
            render json: author
        else 
            render json: author.errors 
        end 
    end 
