Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  scope :api do
    scope :v1 do
      resources :users, only: [:create]
      resources :sessions, only: [:create]
      resources :books, only: [:index, :create, :show]
    end
  end
end
