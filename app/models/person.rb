class Person < ApplicationRecord
    has_and_belongs_to_many :addresses
    has_and_belongs_to_many :customers

    validates_presence_of :last_name
end
