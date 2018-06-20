# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

ActiveSupport::Inflector.inflections do |inflect|
    inflect.irregular 'person', 'people'
    inflect.irregular 'address', 'addresses'
    inflect.irregular 'country', 'countries'
    inflect.irregular 'county', 'counties'
   end
   