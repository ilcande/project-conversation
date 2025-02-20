Rails.application.routes.draw do
  root to: "projects#index"
  get "up" => "rails/health#show", as: :rails_health_check

  resources :projects, only: [:index, :show, :update] do
    resources :comments, only: [:create]
  end
end
