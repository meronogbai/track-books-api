class BooksController < ApplicationController
  before_action :authenticate

  def index
    books = current_user.books
    render json: { books: books }
  end

  def create
    book = current_user.books.build(book_params)
    if book.valid?
      book.save
      render json: { book: book }, status: :created
    else
      render json: { error: book.errors.full_messages }, status: :not_acceptable
    end
  end

  def show
    book = current_user.books.find_by(id: params[:id])
    if book
      render json: { book: book, success: "#{book.title} found." }
    else
      render json: { failure: "Book doesn't exist." }, status: :not_found
    end
  end

  private

  def book_params
    params.permit(:title, :total_chapters, :completed_chapters)
  end
end
