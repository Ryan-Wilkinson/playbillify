Rails.application.routes.draw do
		devise_for :users, controllers: {
		registrations: 'users/registrations'
	}

  get 'static_pages/home'
	root 'static_pages#home'

  # Custom routes
  get '/ads' => 'ads#index', as: "ads_index"
  get '/organizations/:organization_id/events/:event_id/ads/:id/purchase' => 'ads#purchase', as: "ads_purchase"

	resources :organizations do
    resources :events do
      resources :ads
    end
  end
end
