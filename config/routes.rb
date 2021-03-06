Rails.application.routes.draw do
  get 'homes/index'
  get "/note", to: 'homes#note'
  get "/not_certified", to: "homes#not_certified"
  root "homes#index"
  post "/posts", to: "homes#create"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
