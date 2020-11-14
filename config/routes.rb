Rails.application.routes.draw do
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

	namespace :admins do
		resources :anime, only: [:index, :edit, :show, :update, :destroy]
	end

	namespace :users do
		resources :anime do
    		resource :favorites, only: [:create, :destroy]
    		get :search, to: 'anime#index', on: :collection
			get :tag, on: :collection
	    end
	end
end
