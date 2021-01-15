class Book < ApplicationRecord
  belongs_to :author

  validates :title, presence: true
  validates :pages, presence: true
  validates :chapters, presence: true
  validates :author_id, presence: true

  validates :pages, numericality: { only_integer: true }
  validates :chapters, numericality: { only_integer: true }
end
