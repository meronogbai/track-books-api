require 'rails_helper'

RSpec.describe User, type: :model do
  it 'validates user if length of username is >= 2' do
    user = User.new(username: 'test_user', password: '123456')
    expect(user.valid?).to be true
  end

  it "doesn't validate user if username doesn't exist" do
    user = User.new(password: '123456')
    expect(user.valid?).to be false
  end

  it "doesn't validate user if length of name is < 2" do
    user = User.new(username: 't', password: '123456')
    expect(user.valid?).to be false
  end

  it "doesn't validate user if length of name is > 20" do
    user = User.new(username: 't' * 21, password: '123456')
    expect(user.valid?).to be false
  end

  it "doesn't validate user if password doesn't exist" do
    user = User.new(username: 'test_user')
    expect(user.valid?).to be false
  end

  it "doesn't validates user if password length is less than 6" do
    user = User.new(username: 'test_user', password: '12345')
    expect(user.valid?).to be false
  end

  it 'validates user if password length is greater than or equal to 6' do
    user = User.new(username: 'test_user', password: '1234567')
    expect(user.valid?).to be true
  end

  it "doesn't validate user if name already exists" do
    User.create!(username: 'test_user', password: '123456')
    user = User.new(username: 'test_user', password: '123456')
    expect(user.valid?).to be false
  end
end
