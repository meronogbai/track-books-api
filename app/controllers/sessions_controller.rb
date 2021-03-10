class SessionsController < ApplicationController
  def create
    user = User.find_by(username: params[:username])
    if user&.authenticate(params[:password])
      payload = { user_id: user.id }
      token = encode_token(payload)
      render json: { username: user.username, jwt: token }
    else
      render json: { failure: 'Login failed! Invalid username/password combination.' }, status: :not_acceptable
    end
  end
end
