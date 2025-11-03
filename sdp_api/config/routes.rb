Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :scales, only: %i[create show index]
      resources :surveys, only: %i[create show] do
        member do
          get :summary
        end
        resources :responses, only: %i[create]
      end
    end
  end
end
