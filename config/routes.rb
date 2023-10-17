Rails.application.routes.draw do
  devise_for :users
  root "positions#index"

  resources :positions do
    resources :candidates do
      post :assign_assessment_to_candidate
    end
  end

  resources :assessments

  namespace :api do
    namespace :v1 do
      resources :positions do
        resources :candidates do
        end
      end
    end
  end
end
