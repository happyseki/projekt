class UsersController < ApplicationController
  def create
    #params: { username: '', password: '' }
    user = User.create(user_params)
    is_valid = user.valid?
    if is_valid
      render json: { token: encode_token(user) }
    else
      render json: { errors: user.errors.full_messages }
    end
    # below is repeating code, in order to prevent this, write method at application_conroller
    # if is_valid
    #   payload = { user_id: user.id }
    #   token = JWT.encode payload, 'e', 'HS256'
    #   render json: {token: token}
    # else
    #   render json: { errors: user.errors.full_messages }
    # end
  end

  def profile
    user = User.find(user_id)
    render json: user
  end

  private
#strong params
  def user_params
   params.permit(:username, :password)
  end
end
