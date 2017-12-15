Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :locations do
        resources :shops
      end

      resources :shops, only: :index
    end
  end
end
