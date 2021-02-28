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

  private

  def user_params
    params.permit(:username, :password)
  end
end
