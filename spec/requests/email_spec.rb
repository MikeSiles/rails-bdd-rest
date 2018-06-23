require 'rails_helper'

RSpec.describe 'Email API', type: :request do
    # set up the api auth
    let(:user) {
        create(:user)
    }
    let(:headers) {
        valid_headers
    }

    # initialize test data
    let!(:emails) {
        create_list(:email, 25)
    }
    let(:email_id) {
        emails.first.id
    }

    # Tests for GET /email
    describe 'GET /email' do

        before { get '/email', headers: headers }

        it 'returns emails' do
            expect(json).not_to be_empty
            expect(json.size).to eq(25)
        end

        it 'returns status code 200' do
            expect(response).to have_http_status(200)
        end
    end

    # Tests for single email GET
    describe 'GET /email/:id' do
        before { get "/email/#{email_id}", headers: headers }

        context 'when the email exists' do
            it 'returns the email' do
                expect(json).not_to be_empty
                expect(json['id']).to eq(email_id)
            end

            it 'returns status code 200' do
                expect(response).to have_http_status(200)
            end

            context 'when the record does not exist' do
                let(:email_id) { 100 }
    
                it 'returns the status code 404' do
                    expect(response).to have_http_status(404)
                end
    
                it 'returns a not found message' do
                    expect(response.body).to match(/Couldn't find Email/)
                end
            end
        end
    end

    # Tests for POST /email (create)
    describe 'POST /email' do

        context 'when the body is valid' do
            before {
                post '/email',
                params: { address: 'test@example.com' }.to_json,
                headers: headers }

            it 'creates a email' do
                expect(json['address']).to eq ('test@example.com')
            end

            it 'returns a status code 201' do
                expect(response).to have_http_status(201)
            end
        end

        context 'when the body is invalid' do
            before {
                post '/email',
                params: {
                    email: 'test@example.com',
                }.to_json,          
                headers: headers
            }

            it 'returns status code 422' do
                expect(response).to have_http_status(422)
            end

            it 'returns a validation failure message' do
                expect(response.body).to match(/Validation failed: Address can't be blank/)
            end
        end
    end

    # Tests for PUT /email/:id (replace)
    describe 'PUT /email/:id' do

        context 'when the email exists and the body is valid' do
            before {
                put "/email/#{email_id}",
                params: { address: 'test2@example.com' }.to_json,
                headers: headers
            }

            it 'updates the record' do
                expect(json).not_to be_empty
                expect(json['id']).to eq(email_id)
                expect(json['address']).to eq('test2@example.com')
            end

            it 'returns status code 200' do
                expect(response).to have_http_status(200)
            end
        end

        context 'when the email does not exist' do
            let(:email_id) { 100 }

            before {
                put "/email/#{email_id}",
                params: { address: 'test2@example.com' }.to_json,
                headers: headers
            }

            it 'returns status code 404' do
                expect(response).to have_http_status(404)
            end

            it 'returns a not found message' do
                expect(response.body).to match(/{"message":"Couldn't find Email with 'id'=100"}/)
            end
        end
    end
    # Tests for PATCH /email/:id (update)
    # Tests for DELETE /email/:id (remove)
    describe 'DELETE /email/:id' do
        before {
            delete "/email/#{email_id}",
            headers: headers
        }

        it 'returns status code 204' do
            expect(response).to have_http_status(204)
        end
    end
end