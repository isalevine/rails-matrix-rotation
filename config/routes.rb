Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # get 'pages/index'
  root to: "pages#index"
  post "/", to: "pages#index"

end
