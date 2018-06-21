class CountryController < ApplicationController
    # authorization only needed when modifying records
    skip_before_action :authorize_request, only: [:index,:show]

    def valid_params
        params.permit(:name)
    end

    # GET /country
    # returns all countries
    def index
        @countries = Country.all
        json_response(@countries)
    end

    # GET /country/:id
    # returns a country with matching :id
    def show
        @country = Country.find(params[:id])
        json_response(@country)
    end

    # POST /country
    # adds a new country to the db
    def create
        @country = Country.create!(valid_params)
        json_response(@country, :created)
    end
end
