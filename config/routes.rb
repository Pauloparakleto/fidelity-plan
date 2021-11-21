Rails.application.routes.draw do
  devise_for :admins, :skip => [:registration]
  as :admin do
    get 'admins/edit' => 'devise/registrations#edit', :as => 'edit_admin_registration'
    patch 'admins' => 'devise/registrations#update', :as => 'admin_registration'
  end
  devise_for :users
  root to: 'wellcome#welcome'

  devise_scope :user do
    get 'sign_out', to: 'devise/sessions#destroy'
    get 'sign_in', to: 'devise/sessions#new'
  end

  get '/users/index', to: 'users#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
