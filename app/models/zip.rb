class Zip < ApplicationRecord
    belongs_to :state
    validates_presence_of :code
end
