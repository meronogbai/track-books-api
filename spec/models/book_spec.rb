require 'rails_helper'

RSpec.describe Book, type: :model do
  
  before(:example) do
    @user = User.create!(username: 'test_user', password: '123456')
  end

  it 'validates book if length of title >= 2' do
    book = @user.books.build(title: 'test_book', total_chapters: 50)
    expect(book.valid?).to be true
  end

  it 'validate book if completed chapters is < total chapters' do
    book = @user.books.build(title: 'test_book', total_chapters: 99, completed_chapters: 50)
    expect(book.valid?).to be true
  end

  it "doesn't validate book if title doesn't exist" do
    book = @user.books.build(total_chapters: 50)
    expect(book.valid?).to be false
  end

  it "doesn't validate book if total chapters isn't a number" do
    book = @user.books.build(title: 'test_book', total_chapters: 'test')
    expect(book.valid?).to be false
  end

  it "doesn't validate book if total chapters is 0" do
    book = @user.books.build(title: 'test_book', total_chapters: 0)
    expect(book.valid?).to be false
  end

  it "doesn't validate book if total chapters is >= 1000" do
    book = @user.books.build(title: 'test_book', total_chapters: 1000)
    expect(book.valid?).to be false
  end

  it "doesn't validate book if completed chapters is > total chapters" do
    book = @user.books.build(title: 'test_book', total_chapters: 99, completed_chapters: 100)
    expect(book.valid?).to be false
  end
end
