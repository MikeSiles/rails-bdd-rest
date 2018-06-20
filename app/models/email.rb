class Email < ApplicationRecord
    validates_presence_of :address
end
