Rails.application.routes.draw do

  devise_for :authors, controllers: {
    registrations: 'authors/registrations' }

  root to: '_blog/pages#home'

  resource :relationships, only: [:create, :destroy]

  resources :notifications do
    collection do
      post :mark_as_read
    end
  end

	namespace :authors do
		resources :posts do
			put 'publish' => 'posts#publish', on: :member
			put 'unpublish' => 'posts#unpublish', on: :member
		end
	end

  get 'perfil' => 'perfil/posts#index'
  get 'perfil/:id' => 'perfil/posts#show', as: :author

	scope module: 'blog' do
		get 'about' => 'pages#about', as: :about
		get 'posts' => 'posts#index', as: :posts
		get 'posts/:id' => 'posts#show', as: :post
	end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
