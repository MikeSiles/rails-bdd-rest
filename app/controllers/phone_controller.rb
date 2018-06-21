class PhoneController < ApplicationController

    def valid_params
        params.permit(:number, :extension, :line_type)
    end

    # find an individual record first in single-record verbs
    before_action :find_record, only: [:show, :update, :destroy]
    def find_record
        @phone = Phone.find(params[:id])
    end

        # GET /phone
    # returns all phones
    def index
        @phones = Phone.all
        json_response(@phones)
    end

    # POST /phone
    # adds a new phone to the db
    def create
        @phone = Phone.create!(valid_params)
        json_response(@phone, :created)
    end

    # GET /phone/:id
    # returns a phone with matching :id
    def show
        json_response(@phone)
    end

    # PUT /phone/:id
    # replaces a phone with pk :id
    def update
        @phone.update(valid_params)
        json_response(@phone)
    end

    def destroy
        @phone.destroy
    end
end
