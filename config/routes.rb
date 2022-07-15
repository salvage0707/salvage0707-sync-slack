Rails.application.routes.draw do
  devise_for :users, path_names: {
    sign_in: "login",
    sign_out: "logout",
  }
  get "home", to: "home#index"
end

# == Route Map
#
