Rails.application.routes.draw do
		devise_for :users, controllers: {
		registrations: 'users/registrations'
	}

  root to: 'client#index'
  get '*path', to: 'client#index'
end
