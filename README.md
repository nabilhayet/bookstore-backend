# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

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

7. Installation : https://github.com/nabilhayet/bookstore-frontend.git 
                  https://github.com/nabilhayet/bookstore-backend.git

8. Reference : https://learn.co/tracks/online-software-engineering-structured/redux/async-redux/redux-thunk
               https://learn.co/tracks/online-software-engineering-structured/redux/react-redux-continued/when-to-connect-react-and-redux
               https://learn.co/tracks/online-software-engineering-structured/redux/redux-library/combine-reducers-codealong
               https://learn.co/tracks/online-software-engineering-structured/redux/building-redux/redux-create-store-lab
               https://learn.co/tracks/online-software-engineering-structured/react/async-react/async-react
               https://learn.co/tracks/online-software-engineering-structured/react/lifecycle-methods/react-component-lifecycle-overview
               https://learn.co/tracks/online-software-engineering-structured/react/forms/forms

9. Tests -- Go to backend folder using cd from parent directory. -- Type 'rails s' to run the server -- run 'npm start' to open the page in the browser. -- To add an author click on 'Add Author' Navlink in the browser. -- To create a book click on 'Add Book' link in the browser. -- To view all books click on 'View Books'. -- To view all authors click on 'View Authors'. -- To view details of a book/author click on the individual name of book/author.-- To update/delete any particular author click on 'update/delete' button.

10. Credits : https://www.youtube.com/watch?v=3iISwPKdJ3E&feature=youtu.be