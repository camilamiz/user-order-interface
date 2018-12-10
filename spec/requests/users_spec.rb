require 'rails_helper'

RSpec.describe 'API V1 Users', type: :request do
  # initialize test data
  let!(:users) { create_list(:user, 10) }
  let(:user_id) { users.first.id }

  # Test suite for GET /todos
  describe 'GET /api/v1/users' do
    # make HTTP get request before each example
    before { get '/api/v1/users' }

    it 'returns users' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end #describe GET

  # Test suite for GET /todos/:id
  describe 'GET /api/v1/users/:id' do
    before { get "/api/v1/users/#{user_id}" }

    context 'when the record exists' do
      it 'returns the user' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(user_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end #context record exists

    context 'when the record does not exist' do
      let(:user_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find User/)
      end
    end #context record does not exist

  end #describe GET



  # Test suite for POST /todos
  # describe 'POST /api/v1/users' do
  #   # valid payload
  #   let(:valid_attributes) { { name: 'Learn Elm', cpf: '12345678911', email: 'learnelm@email.com' } }
  #   context 'when the request is valid' do
  #     before { post '/api/v1/users', params: valid_attributes }

  #     it 'creates a user' do
  #       expect(json['name']).to eq('Learn Elm')
  #     end

  #     it 'returns status code 201' do
  #       expect(response).to have_http_status(201)
  #     end
  #   end #context valid

  #   context 'when the request is invalid' do
  #     before { post '/api/v1/users', params: { name: 'Foobar' } }

  #     it 'returns status code 422' do
  #       expect(response).to have_http_status(422)
  #     end

  #     it 'returns a validation failure message' do
  #       expect(response.body)
  #         .to match(/Validation failed: Created by can't be blank/)
  #     end
  #   end #context invalid
  # end #describe post


end #rspec.describe
