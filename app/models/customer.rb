class Customer < ApplicationRecord
  has_and_belongs_to_many :addresses
  has_and_belongs_to_many :people
  has_and_belongs_to_many :phones
  has_and_belongs_to_many :emails

  belongs_to :salesperson
  validates_presence_of :name
end
