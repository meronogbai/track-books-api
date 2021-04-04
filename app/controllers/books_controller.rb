class BooksController < ApplicationController
  before_action :authenticate
  before_action :find_book, only: %i[show update destroy]

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
    render json: { book: @book, success: "#{@book.title} found." }
  end

  def update
    if params[:completed_chapters].to_i <= @book.total_chapters
      @book.update(completed_chapters: params[:completed_chapters])
      render json: { book: @book, success: "#{@book.title} updated." }
    else
      render json: { failure: "Completed chapters can't be higher than total chapters." }, status: :not_acceptable
    end
  end

  def destroy
    @book.destroy
    render json: { success: 'Book was deleted successfully.'}, status: :ok
  end

  private

  def find_book
    @book = current_user.books.find_by(id: params[:id])
    render json: { failure: "Book doesn't exist." }, status: :not_found unless @book
  end

  def book_params
    params.permit(:title, :total_chapters, :completed_chapters)
  end
end
