Rails.application.routes.draw do
		devise_for :users, controllers: {
		registrations: 'users/registrations'
	}

  get 'scaffold/Organization'

  devise_for :users
  resources :organizations do
    resources :events
  end

  root to: 'client#index'
  get '*path', to: 'client#index'
end

