require 'rails_helper'

RSpec.describe 'Sessions', type: :request do
  before(:example) do
    @user = User.create(username: 'test_user', password: '123456')
  end

  it 'creates a new session if user exists' do
    post '/api/v1/sessions', params: { username: 'test_user', password: '123456' }
    expect(response).to have_http_status :ok
  end

  it "doesn't create a new session if given invalid username/password combo" do
    post '/api/v1/sessions', params: { username: 'test_user', password: '12345' }
    expect(response).to have_http_status :not_acceptable
  end
end
