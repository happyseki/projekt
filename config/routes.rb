Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # AuthController#login
  post '/login', to: "auth#login"
end
