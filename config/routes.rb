Rails.application.routes.draw do
  resources :drinks
  resources :foods

  get '/menu', to: 'menus#show'
  patch '/menu/:id', to: 'menus#update_image', as: 'update_food_image'


  devise_for :admins, :skip => [:registration]
  as :admin do
    get 'admins/edit' => 'devise/registrations#edit', :as => 'edit_admin_registration'
    patch 'admins' => 'devise/registrations#update', :as => 'admin_registration'
  end
  devise_for :users

  root to: 'wellcome#welcome'

  get '/users_badges/' => 'users_badges#show', as: :user_root # creates user_root_path

  get '/users_badges/:id', to: 'users_badges#show', as: 'users_badges'
  get '/users/index', to: 'users#index'

  devise_scope :user do
    get 'sign_out', to: 'devise/sessions#destroy'
    get 'sign_in', to: 'devise/sessions#new'
  end

  # whatsapp
  namespace :api do
    namespace :v1 do
      get '/whatsapp/send_one_way_message', as: 'send_one_way_message'
      post '/bot', to: 'whatsapp#bot'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
