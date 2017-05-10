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
  get '/enter-business-details' => 'businesses#enter_business_details', as: "enter_business_details"
  get '/ads/:id/charges/new' => 'charges#new', as: "ads_new_charge"
  post '/ads/:id/charges/' => 'charges#create', as: "ads_charges"
  get '/events' => 'events#index', as: "events_all"
  resources :businesses
  resources :charges

	resources :organizations do
    resources :events do
      resources :ads
    end
  end
end
