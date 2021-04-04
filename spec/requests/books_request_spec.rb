require 'rails_helper'

RSpec.describe 'Books', type: :request do
  before(:example) do
    @user = User.create(username: 'test_user', password: '123456')
    @book = @user.books.create(title: 'Test Title', total_chapters: 12, completed_chapters: 10)
    token = JWT.encode({ user_id: @user.id }, Rails.application.secret_key_base)
    @headers = { Authorization: "Bearer #{token}" }
  end

  it 'shows all books' do
    get '/api/v1/books', headers: @headers
    expect(response).to have_http_status(:ok)
  end

  it 'creates a book' do
    post '/api/v1/books',
         params: { title: 'Test Title', total_chapters: 12, completed_chapters: 10 },
         headers: @headers
    expect(response).to have_http_status(:created)
  end

  it 'shows book info' do
    get "/api/v1/books/#{@book.id}", headers: @headers
    expect(response).to have_http_status(:ok)
  end

  it "updates a book's completed chapters" do
    patch "/api/v1/books/#{@book.id}", params: { completed_chapters: 11 }, headers: @headers
    expect(response).to have_http_status(:ok)
  end

  it 'deletes a book' do
    delete "/api/v1/books/#{@book.id}", headers: @headers
    expect(response).to have_http_status(:ok)
  end
end
