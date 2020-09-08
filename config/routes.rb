Rails.application.routes.draw do

  namespace :admin do
    get 'orders/index'
    get 'orders/show'
  end
  devise_for :admins, skip: :all
  devise_scope :admin do
    get 'admin/sign_in' => 'admins/sessions#new', as: 'new_admin_session'
    post 'admin/sign_in' => 'admins/sessions#create', as: 'admin_session'
    delete 'admin/sign_out' => 'admins/sessions#destroy', as: 'destroy_admin_session'    
  end

  devise_for :end_users, skip: :all
  devise_scope :end_user do
    get 'end_users/sign_in' => 'end_users/sessions#new', as: 'new_end_user_session'
    post 'end_users/sign_in' => 'end_users/sessions#create', as: 'end_user_session'
    delete 'end_users/sign_out' => 'end_users/sessions#destroy', as: 'destroy_end_user_session'
    get 'end_users/sign_up' => 'end_users/registrations#new', as: 'new_end_user_registration'
    post 'end_users' => 'end_users/registrations#create', as: 'end_user_registration'
    get 'end_users/password/new' => 'end_users/passwords#new', as: 'new_end_user_password'
  end

  namespace :admin do
    get 'top' => 'tops#top'
    resources :end_users,only: [:index,:show,:edit,:update]
    resources :genres,only: [:index,:create,:edit,:update]
    resources :items,except: [:destroy]
    resources :order_details,only: [:update]
    resources :orders,only: [:index,:show,:update]
  end

  root to: 'public/items#top'

  scope module: :public do
    resource :end_users,only: [:show,:edit,:update]
    get 'end_users/leave' => 'end_users#leave'
    patch 'end_users/withdrawal' => 'end_users#withdrawal'

    resources :items,only: [:index,:show] do
    	resources :cart_items,only: [:create]
	end

	delete 'cart_items' => 'cart_items#destroy_all'
	resources :cart_items,only: [:index,:update,:destroy]

	post 'orders/confirm' => 'orders#confirm'
  get 'orders/done' => 'orders#done'
	resources :orders,only: [:new,:index,:show,:create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
