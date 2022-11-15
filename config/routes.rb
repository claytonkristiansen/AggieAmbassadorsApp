Rails.application.routes.draw do
  resources :locations
  resources :events do
    member do
      get :delete
    end
  end

  resources :organizations do
    member do
      get :delete
    end
  end

  resources :events do
    member do
      get :delete
    end
    member do
      get :register
    end
    member do
      get :register_details
    end
    member do
        get :unregister
      end
    member do
    get :unregister_details
    end
  end

  resources :attendance_records do
    member do
      get :delete
    end
  end
  root to: 'dashboards#show'
  devise_for :members, controllers: { omniauth_callbacks: 'members/omniauth_callbacks' }
  devise_scope :member do
    get 'members/sign_in', to: 'members/sessions#new', as: :new_member_session
    get 'members/sign_out', to: 'members/sessions#destroy', as: :destroy_member_session
  end

  get 'creating_new_user', action: :new, controller: 'members'

  resources :members do
    member do
      get :delete
    end
  end
end