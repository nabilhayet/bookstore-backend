class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :pages, :chapters, :author_id
  belongs_to :author
end
