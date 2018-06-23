class EmailController < ApplicationController

    def valid_params
        params.permit(:address)
    end

    # find an individual record first in single-record verbs
    before_action :find_record, only: [:show, :update, :destroy]
    def find_record
        @email = Email.find(params[:id])
    end

        # GET /email
    # returns all emails
    def index
        @emails = Email.all
        json_response(@emails)
    end

    # POST /email
    # adds a new email to the db
    def create
        @email = Email.create!(valid_params)
        json_response(@email, :created)
    end

    # GET /email/:id
    # returns a email with matching :id
    def show
        json_response(@email)
    end

    # PUT /email/:id
    # replaces a email with pk :id
    def update
        @email.update(valid_params)
        json_response(@email)
    end

    def destroy
        @email.destroy
    end
end
