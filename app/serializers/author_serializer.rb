class AuthorSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :age, :contact
  has_many :books 
end
