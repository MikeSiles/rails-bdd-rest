class Salesperson < ApplicationRecord
  belongs_to :user
  belongs_to :person

  has_many :customers
end
