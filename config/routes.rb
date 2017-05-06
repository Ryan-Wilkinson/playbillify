Rails.application.routes.draw do
		devise_for :users, controllers: {
		registrations: 'users/registrations'
	}

  get 'static_pages/home'
	root 'static_pages#home'

  get '/ads' => 'ads#index', as: "ads_index"

	resources :organizations do
    resources :events do
      resources :ads
    end
  end
end
