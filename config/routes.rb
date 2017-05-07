Rails.application.routes.draw do
		devise_for :users, controllers: {
		registrations: 'users/registrations'
	}

  get 'static_pages/home'
	root 'static_pages#home'

  # Custom routes
  get '/ads' => 'ads#index', as: "ads_index"
  get '/organizations/:organization_id/events/:event_id/ads/:id/purchase' => 'ads#purchase', as: "ads_purchase"
  get '/ads/:id/add-image' => 'ads#add_image', as: "ads_add_image"
  get '/ads/purchased-ads' => 'ads#purchased_ads', as: "ads_purchased_ads"

  # Specifying route for entering business info in Devise
  devise_scope :user do get '/enter-business-details' => 'users/registrations#enter_business_details', as: "users_enter_business_details"
  end

	resources :organizations do
    resources :events do
      resources :ads
    end
  end
end
