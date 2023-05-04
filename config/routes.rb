Rails.application.routes.draw do

  get 'reservations/index'
  # ログイン、アカウント編集後、任意のページに推移させるための記述
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  root 'home#top'

  resources :users, only: [:index,:show,:update] do
    member do
      get 'profile'
      get 'profile_edit'

    end
  end
  resources :rooms do
    member do
      get 'own'
    end
  end

  resources :reservations do
    member do
      post 'confirm'
      get 'confirm'
    end
  end

end