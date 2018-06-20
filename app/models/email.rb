class Email < ApplicationRecord
    has_and_belongs_to_many :people
    has_and_belongs_to_many :customers
    
    validates_presence_of :address
end
