Rails.application.routes.draw do
  devise_for :users
  root to: "projects#index"
  get "up" => "rails/health#show", as: :rails_health_check

  resources :projects, only: [:index, :show, :new, :create, :update] do
    resources :comments, only: [:create, :destroy]
  end
end
