class StateController < ApplicationController
    def valid_params
        # if this is in the nested country route, always use
        # that county for country_id
        unless params[:state][:country_id].present?
            if params[:country_id].present?
                params[:state][:country_id] = params[:country_id]
            end
        end

        params.permit(:name, :postal_code, :country_id)
    end

    # authorization only needed when modifying records
    skip_before_action :authorize_request, only: [:index,:show]

    # find an individual record first in single-record verbs
    before_action :find_record, only: [:show, :update, :destroy]

    def find_record
        @state = State.find(params[:id])
    end


    # GET /state
    # returns all states
    def index
        @states = states.all
        json_response(@states)
    end

    # POST /state
    # adds a new state to the db
    def create
        @state = State.create!(valid_params)
        json_response(@state, :created)
    end

    # GET /state/:id
    # returns a state with matching :id
    def show
        json_response(@state)
    end

    # PUT /state/:id
    # replaces a state with pk :id
    def update
        @state.update(valid_params)
        json_response(@state)
    end

    def destroy
        @state.destroy
    end

private
    def states
        if params[:country_id].present?
            Country.find(params[:country_id]).states
        else
            State
        end
    rescue ActiveRecord::RecordNotFound
        redirect_to state_path(alert: 'Country not found')
    end
end
