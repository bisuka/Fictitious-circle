Rails.application.routes.draw do
  namespace :users do
    get 'favorites/create'
    get 'favorites/destroy'
  end
	devise_for :admins, controllers: {
	  sessions:      'admins/sessions',
	  passwords:     'admins/passwords',
	  registrations: 'admins/registrations'
	}
	devise_for :users, controllers: {
	  sessions:      'users/sessions',
	  passwords:     'users/passwords',
	  registrations: 'users/registrations'
	}

	root 'users/anime#top'

	namespace :users do
		resources :anime
    	resource :favorites, only: [:create, :destroy]
	end
end
