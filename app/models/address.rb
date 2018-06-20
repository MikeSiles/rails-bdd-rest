class Address < ApplicationRecord
  belongs_to :state
  belongs_to :county
  belongs_to :zip
  belongs_to :country

  has_and_belongs_to_many :people
  has_and_belongs_to_many :customers

  validates_presence_of :line_1, :state, :country
end
