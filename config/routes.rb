Rails.application.routes.draw do
  #get 'queries/show'
  #get 'queries/new'

  #post '/queries/new' => 'queries#create'
  #patch '/queries/:id/edit' => 'queries#update'

  devise_for :users, :controllers => { :confirmations => 'confirmations', 
                                       :registrations => 'registrations' } 

  authenticate :user do
    resources :queries
    post '/queries/new' => 'queries#create'
  end

  # custom routes for devise.
  # set default scope to :user.
  devise_scope :user do
    get '/login' => 'devise/sessions#new'
    delete '/logout' => 'devise/sessions#destroy'

    patch '/confirm' => 'confirmations#confirm'

    authenticated :user do
      root :to => 'dashboard#index'
    end

    # hackish way to circumvent https://github.com/plataformatec/devise/issues/2393
    # redirect unauthenticated users to sign up
    unauthenticated :user do
      root :to => 'registrations#new', as: :unauthenticated_root
    end
  end

  resources :users, only: [:show, :edit, :update]

  # validate location input clientside
  get '/validate_location' => 'queries#validate_location'

  # Misc. static pages
  get '/thanks' => 'static_pages#thanks'
end
