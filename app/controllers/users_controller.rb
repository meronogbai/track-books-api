class UsersController < ApplicationController
  def create
    user = User.new(user_params)
    if user.valid?
      user.save
      payload = { user_id: user.id }
      token = encode_token(payload)
      render json: { user: user, jwt: token }
    else
      render json: { error: user.errors.full_messages }, status: :not_acceptable
    end
  end

  def login
    user = User.find_by(username: params[:username])
    if user&.authenticate(params[:password])
      payload = { user_id: user.id }
      token = encode_token(payload)
      render json: { user: user, jwt: token, success: "Welcome back, #{user.username}" }
    else
      render json: { failure: 'Login failed! Invalid username/password combination.' }
    end
  end

  private

  def user_params
    params.permit(:username, :password)
  end

  def encode_token(payload)
    JWT.encode(payload, Rails.application.secrets.secret_key_base)
  end
end
