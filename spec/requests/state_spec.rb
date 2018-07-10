require 'rails_helper'

RSpec.describe 'State API', type: :request do
    # set up the api auth
    let(:user) {
        create(:user)
    }
    let(:headers) {
        valid_headers
    }

    # initialize test data
    let!(:country) { create(:country) }
    let!(:country_id) { country.id }
    let!(:states) { create_list(:state, 25, country_id: country.id) }
    let(:state_id) { states.first.id }

    # Tests for GET /state
    describe "GET /state" do

        before { get "/state" }

            it 'returns states' do
                expect(json).not_to be_empty
                expect(json.size).to eq(25)
            end

            it 'returns status code 200' do
                expect(response).to have_http_status(200)
            end
    end

    # Tests for single state GET
    describe 'GET /state/:state_id' do
        before { get "/state/#{state_id}" }

        context 'when the state exists' do
            it 'returns the state' do
                expect(json).not_to be_empty
                expect(json['id']).to eq(state_id)
            end

            it 'returns status code 200' do
                expect(response).to have_http_status(200)
            end

            context 'when the record does not exist' do
                let(:state_id) { 100 }
    
                it 'returns the status code 404' do
                    expect(response).to have_http_status(404)
                end
    
                it 'returns a not found message' do
                    expect(response.body).to match(/Couldn't find State/)
                end
            end
        end
    end

    # Tests for POST /state (create)
    describe 'POST /state' do

        context 'when the body is valid' do
            before {
                post "/state",
                params: {
                    name: 'Lincoln',
                    postal_code: 'LK',
                    country_id: country_id,
                 }.to_json,
                 headers: headers }

            it 'creates a state' do
                expect(json['name']).to eq('Lincoln')
                expect(json['postal_code']).to eq('LK')
                expect(json['country_id']).to eq(country_id)
            end

            it 'returns a status code 201' do
                expect(response).to have_http_status(201)
            end
        end

        context 'when the body is invalid' do
            before {
                post "/state",
                params: {
                    state: 'Lincoln',
                    postal_code: 'LK',
                    country_id: country_id,
                }.to_json,
                headers: headers
            }

            it 'returns status code 422' do
                expect(response).to have_http_status(422)
            end

            it 'returns a validation failure message' do
                expect(response.body).to match(/Validation failed: Name can't be blank/)
            end
        end
    end

    # Tests for PUT /state/:state_id (replace)
    describe 'PUT /state/:state_id' do
        let!(:next_country) { create(:country) }
        
        context 'when the state exists and the body is valid' do
            before {
                put "/country/#{country_id}/state/#{state_id}",
                params: {
                    name: 'Jeffersonia',
                    postal_code: 'JF',
                 }.to_json,
                headers: headers
            }

            it 'updates the record' do
                expect(json).not_to be_empty
                expect(json['id']).to eq(state_id)
                expect(json['name']).to eq('Jeffersonia')
            end

            it 'returns status code 200' do
                expect(response).to have_http_status(200)
            end
        end

        context 'when the state does not exist' do
            let(:state_id) { 100 }

            before {
                put "/country/#{next_country.id}/state/#{state_id}",
                params: {
                    name: 'Jeffersonia',
                    postal_code: 'JF',
                    country_id: next_country.id
                 }.to_json,
                 headers: headers
            }

            it 'returns status code 404' do
                expect(response).to have_http_status(404)
            end

            it 'returns a not found message' do
                expect(response.body).to match(/{"message":"Couldn't find State with 'id'=100"}/)
            end
        end
    end
    # Tests for PATCH /state/:state_id (update)
    # Tests for DELETE /state/:state_id (remove)
    describe 'DELETE /state/:id' do
        before {
            delete "/state/#{state_id}",
            headers: headers
        }

        it 'returns status code 204' do
            expect(response).to have_http_status(204)
        end
    end

    # Tests for GET /country/:country_id/state
    describe "GET /country/:country_id/state" do
        before { get "/country/#{country_id}/state" }

        context 'when the country exists' do
            it 'returns states' do
                expect(json).not_to be_empty
                expect(json.size).to eq(25)
            end

            it 'returns status code 200' do
                expect(response).to have_http_status(200)
            end
        end

        context 'when the country does not exist' do
            let(:country_id) { 0 }

            it 'returns a not found message' do
                expect(response.body).to match(/Couldn't find Country/)
            end

            it 'returns a status code 404' do
                expect(response).to have_http_status(404)
            end
        end
    end

    # Tests for single state GET
    describe 'GET /country/:country_id/state/:state_id' do
        before { get "/country/#{country_id}/state/#{state_id}" }

        context 'when the state exists' do
            it 'returns the state' do
                expect(json).not_to be_empty
                expect(json['id']).to eq(state_id)
            end

            it 'returns status code 200' do
                expect(response).to have_http_status(200)
            end

            context 'when the record does not exist' do
                let(:state_id) { 100 }
    
                it 'returns the status code 404' do
                    expect(response).to have_http_status(404)
                end
    
                it 'returns a not found message' do
                    expect(response.body).to match(/Couldn't find State/)
                end
            end
        end
    end

    # Tests for POST /country/:country_id/state (create)
    describe 'POST /country/:country_id/state' do

        context 'when the body is valid' do
            before {
                post "/country/#{country_id}/state",
                params: {
                    name: 'Lincoln',
                    postal_code: 'LK',
                    country_id: :country_id,
                 }.to_json,
                 headers: headers }

            it 'creates a state' do
                expect(json['name']).to eq ('Lincoln')
                expect(json['postal_code']).to eq ('LK')
                expect(json['country_id']).to eq (country_id)
            end

            it 'returns a status code 201' do
                expect(response).to have_http_status(201)
            end
        end

        context 'when the body is invalid' do
            before {
                post "/country/#{country_id}/state",
                params: {
                    state: 'Lincoln',
                    postal_code: 'LK',
                    country_id: :country_id,
                }.to_json,
                headers: headers
            }

            it 'returns status code 422' do
                expect(response).to have_http_status(422)
            end

            it 'returns a validation failure message' do
                expect(response.body).to match(/Validation failed: Name can't be blank/)
            end
        end
    end

    # Tests for PUT /country/:country_id/state/:state_id (replace)
    describe 'PUT /country/:country_id/state/:state_id' do
        let!(:next_country) { create(:country) }

        context 'when the state exists and the body is valid' do
            before {
                put "/country/#{next_country.id}/state/#{state_id}",
                params: {
                    name: 'Jeffersonia',
                    postal_code: 'JF',
                    country_id: next_country.id
                 }.to_json,
                headers: headers
            }

            it 'updates the record' do
                expect(json).not_to be_empty
                expect(json['id']).to eq(state_id)
                expect(json['country_id']).to eq(next_country.id)
                expect(json['name']).to eq('Jeffersonia')
                expect(json['postal_code']).to eq('JF')
            end

            it 'returns status code 200' do
                expect(response).to have_http_status(200)
            end
        end

        context 'when the state does not exist' do
            let(:state_id) { 100 }

            before {
                put "/country/#{next_country.id}/state/#{state_id}",
                params: {
                    name: 'Jeffersonia',
                    postal_code: 'JF',
                    country_id: next_country.id
                 }.to_json,
                 headers: headers
            }

            it 'returns status code 404' do
                expect(response).to have_http_status(404)
            end

            it 'returns a not found message' do
                expect(response.body).to match(/{"message":"Couldn't find State with 'id'=100"}/)
            end
        end
    end
    # Tests for PATCH /country/:country_id/state/:state_id (update)
    # Tests for DELETE /country/:country_id/state/:state_id (remove)
    describe 'DELETE /country/:country_id/state/:id' do
        before {
            delete "/country/#{country_id}/state/#{state_id}",
            headers: headers
        }

        it 'returns status code 204' do
            expect(response).to have_http_status(204)
        end
    end
end