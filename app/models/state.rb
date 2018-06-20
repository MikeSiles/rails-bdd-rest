class State < ApplicationRecord
  belongs_to :country
  validates_presence_of :name, :postal_code
end
