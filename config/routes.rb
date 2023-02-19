Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'customers#index'

  resources :customers do
    member do
      put 'serve'
      put 'done_serve'
    end
  end

end
