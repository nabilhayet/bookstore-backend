class Author < ApplicationRecord
    has_many :books 

    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :age, presence: true
    validates :contact, presence: true

    validates :age, numericality: { only_integer: true }
    validates :contact, numericality: { only_integer: true }
end
