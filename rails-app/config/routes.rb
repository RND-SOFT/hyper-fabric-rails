Rails.application.routes.draw do
  resources :containers, only: :index do
    collection do
      post :up
      post :down
    end
  end

  root 'containers#index'
end
