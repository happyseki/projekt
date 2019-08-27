class AuthController < ApplicationController
  def login
    #params:{username:'', password:''}
    #find user by their username
    user = User.find_by(username: params['username'])
    #authenticate the user
    is_authenticated = user.authenticate(params['password'])
    puts "Hey, #{is_authenticated}"
    if is_authenticated
      render json: user
    else
      render json: { error: "wrong username or password" }
    end
    # log in the user
  end
end
