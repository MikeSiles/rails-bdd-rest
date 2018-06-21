require 'rails_helper'

RSpec.describe 'Phone API', type: :request do
    # set up the api auth
    let(:user) {
        create(:user)
    }
    let(:headers) {
        valid_headers
    }

    # initialize test data
    let!(:phones) {
        create_list(:phone, 25)
    }
    let(:phone_id) {
        phones.first.id
    }

    # Tests for GET /phone
    describe 'GET /phone' do

        before { get '/phone', headers: headers }

        it 'returns phones' do
            expect(json).not_to be_empty
            expect(json.size).to eq(25)
        end

        it 'returns status code 200' do
            expect(response).to have_http_status(200)
        end
    end

    # Tests for single phone GET
    describe 'GET /phone/:id' do
        before { get "/phone/#{phone_id}", headers: headers }

        context 'when the phone exists' do
            it 'returns the phone' do
                expect(json).not_to be_empty
                expect(json['id']).to eq(phone_id)
            end

            it 'returns status code 200' do
                expect(response).to have_http_status(200)
            end

            context 'when the record does not exist' do
                let(:phone_id) { 100 }
    
                it 'returns the status code 404' do
                    expect(response).to have_http_status(404)
                end
    
                it 'returns a not found message' do
                    expect(response.body).to match(/Couldn't find Phone/)
                end
            end
        end
    end

    # Tests for POST /phone (create)
    describe 'POST /phone' do

        context 'when the body is valid' do
            before {
                post '/phone',
                params: {
                    number: '(312) 555-7272',
                    extension: '#48',
                    line_type: 'office'
                }.to_json,
                headers: headers }

            it 'creates a phone' do
                expect(json['number']).to eq ('(312) 555-7272')
                expect(json['extension']).to eq ('#48')
                expect(json['line_type']).to eq ('office')
            end

            it 'returns a status code 201' do
                expect(response).to have_http_status(201)
            end
        end

        context 'when the body is invalid' do
            before {
                post '/phone',
                params: {
                    phone: '(312) 555-7272',
                    ext: '#48',
                    line_type: 'office'
                }.to_json,          
                headers: headers
            }

            it 'returns status code 422' do
                expect(response).to have_http_status(422)
            end

            it 'returns a validation failure message' do
                expect(response.body).to match(/Validation failed: Number can't be blank/)
            end
        end
    end

    # Tests for PUT /phone/:id (replace)
    describe 'PUT /phone/:id' do

        context 'when the phone exists and the body is valid' do
            before {
                put "/phone/#{phone_id}",
                params: { number: '(312) 555-6464' }.to_json,
                headers: headers
            }

            it 'updates the record' do
                expect(json).not_to be_empty
                expect(json['id']).to eq(phone_id)
                expect(json['number']).to eq('(312) 555-6464')
            end

            it 'returns status code 200' do
                expect(response).to have_http_status(200)
            end
        end

        context 'when the phone does not exist' do
            let(:phone_id) { 100 }

            before {
                put "/phone/#{phone_id}",
                params: { number: '(312) 555-7272' }.to_json,
                headers: headers
            }

            it 'returns status code 404' do
                expect(response).to have_http_status(404)
            end

            it 'returns a not found message' do
                expect(response.body).to match(/{"message":"Couldn't find Phone with 'id'=100"}/)
            end
        end
    end
    # Tests for PATCH /phone/:id (update)
    # Tests for DELETE /phone/:id (remove)
    describe 'DELETE /phone/:id' do
        before {
            delete "/phone/#{phone_id}",
            headers: headers
        }

        it 'returns status code 204' do
            expect(response).to have_http_status(204)
        end
    end
end