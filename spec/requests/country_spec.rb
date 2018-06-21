require 'rails_helper'

RSpec.describe 'Country API', type: :request do
    # set up the api auth
    let(:user) { create(:user) }
    let(:headers) { valid_headers }

    # initialize test data
    let!(:countries) { create_list(:country, 25) }
    let(:country_id) { countries.first.id }

    # Tests for GET /country
    describe 'GET /country' do

        before { get '/country' }

        it 'returns countries' do
            expect(json).not_to be_empty
            expect(json.size).to eq(25)
        end

        it 'returns status code 200' do
            expect(response).to have_http_status(200)
        end
    end

    # Tests for single country GET
    describe 'GET /country/:id' do
        before { get "/country/#{country_id}" }

        context 'when the country exists' do
            it 'returns the country' do
                expect(json).not_to be_empty
                expect(json['id']).to eq(country_id)
            end

            it 'returns status code 200' do
                expect(response).to have_http_status(200)
            end

            context 'when the record does not exist' do
                let(:country_id) { 100 }
    
                it 'returns the status code 404' do
                    expect(response).to have_http_status(404)
                end
    
                it 'returns a not found message' do
                    expect(response.body).to match(/Couldn't find Country/)
                end
            end
        end
    end

    # Tests for POST /country (create)
    describe 'POST /country' do
        let(:valid_attributes) { { name: 'Zimbabwe' }.to_json }

        context 'when the body is valid' do
            before { post '/country', params: valid_attributes, headers: headers }

            it 'creates a country' do
                expect(json['name']).to eq ('Zimbabwe')
            end

            it 'returns a status code 201' do
                expect(response).to have_http_status(201)
            end
        end

        context 'when the body is invalid' do
            before { post '/country', params: { country: 'Zimbabwe' }.to_json, headers: headers }

            it 'returns status code 422' do
                expect(response).to have_http_status(422)
            end

            it 'returns a validation failure message' do
                expect(response.body).to match(/Validation failed: Name can't be blank/)
            end
        end
    end
end