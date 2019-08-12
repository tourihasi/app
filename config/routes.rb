Rails.application.routes.draw do

  resources :collations
  resource :encoders, only: [:create,:new]
  post 'encoders/new', to: 'encoders#new'

  #users_controller ﾙｰﾃｨﾝｸﾞ
  root to: 'home#new' 
  get '/about', to: 'home#about'
  #users_controller ﾙｰﾃｨﾝｸﾞ
  resources :users   
  
  get '/login', to: 'session#new'
  post '/login', to: 'session#create'
  delete '/logout', to: 'session#destroy'

  #google認証
  get 'auth/:provider/callback', to: 'session#create_g'
  get 'auth/failure', to: redirect('/')

  #多対多のｱｿｼｴｰｼｮﾝ
  resources :messages do
    resource :stars, only: [:create,:destroy]
    resource :comments, only: [:create,:destroy,:new]
  end

  get '/messages_sent', to: 'messages#index_sent'
  
end
