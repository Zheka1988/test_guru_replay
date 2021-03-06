Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'tests#index'

  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout }, :controllers => { sessions: 'sessions' }

  resources :feedbacks, only: %i[new create]
  resources :badges, only: :index

  resources :tests, only: :index do
    post :start, on: :member
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
      post :gist  
    end
  end 

  namespace :admin do
    resources :tests do
      resources :questions, shallow: true do
        resources :answers, shallow: true
      end
      patch :update_inline, on: :member
    end
    # get 'gists/index'
    resources :gists, only: :index

  end

  namespace :admin do
    resources :badges
  end


  get 'feedbacks/new'
  get 'feedbacks/create'
end
