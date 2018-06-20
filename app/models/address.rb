class Address < ApplicationRecord
  belongs_to :state
  belongs_to :county
  belongs_to :zip
  belongs_to :country
end
