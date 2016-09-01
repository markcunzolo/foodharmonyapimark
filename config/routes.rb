Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth', controllers: {
      registrations:  'registrations'
  }

  resources :restaurants
  resources :types
  resources :genres
  resources :restaurant_likes
  resources :contact_us
end
