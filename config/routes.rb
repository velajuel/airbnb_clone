Rails.application.routes.draw do
  get 'welcome/index'

  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "sessions", only: [:create]

  resources :users, controller: "users", only: [:create, :edit] do
    resources :listings do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end
end

resources :listings, controller: "listings" do
  resources :reservations, controller: "reservations"
end


  get "/welcome" => "welcome#index", as: "welcome"
  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/auth/:provider/callback" => "sessions#create_from_omniauth"

  get "users/:user_id/listings/:id/verify" => "listings#verify", as: "verify"
  get "/reservations/:id/checkout" => "braintree#new", as: "reservation_payment"

  post 'braintree/checkout'

  root 'welcome#index'

end
