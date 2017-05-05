Rails.application.routes.draw do
		devise_for :users, controllers: {
		registrations: 'users/registrations'
	}

  get 'static_pages/home'
	get 'scaffold/Organization'

	root 'static_pages#home'

	resources :organizations do
    resources :events
  end
end
