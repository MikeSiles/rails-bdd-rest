class CountryController < ApplicationController

    def valid_params
        params.permit(:name)
    end

    # authorization only needed when modifying records
    skip_before_action :authorize_request, only: [:index,:show]

    # find an individual record first in single-record verbs
    before_action :find_record, only: [:show, :update, :destroy]

    def find_record
        @country = Country.find(params[:id])
    end


    # GET /country
    # returns all countries
    def index
        @countries = Country.all
        json_response(@countries)
    end

    # POST /country
    # adds a new country to the db
    def create
        @country = Country.create!(valid_params)
        json_response(@country, :created)
    end

    # GET /country/:id
    # returns a country with matching :id
    def show
        json_response(@country)
    end

    # PUT /country/:id
    # replaces a country with pk :id
    def update
        @country.update(valid_params)
        json_response(@country)
    end

    def destroy
        @country.destroy
    end

end
