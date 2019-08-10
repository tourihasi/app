Rails.application.routes.draw do

  get 'stars/create'
  get 'stars/destroy'
  #users_controller ﾙｰﾃｨﾝｸﾞ
  root to: 'home#new' 
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
    resource :stars, onlt: [:create,:destroy]
    resource :comments, onry: [:create,:destroy,:new]
  end

  get '/messages_sent', to: 'messages#index_sent'
  
end
