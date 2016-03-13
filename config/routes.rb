Rails.application.routes.draw do
  #mount TalkingStick::Engine, at: '/talking_stick'
  root "home#index"
  get "/indexo"  => "home#indexo"
  get "/teste"  => "home#teste"

  get "/tam12"  => "home#tam12"
  get "/tam13"  => "home#tam13"
  get "/tam14"  => "home#tam14"
  get "/getScreenId"  => "home#getScreenId"

  get "/timelines/tameline" => "timelines#tameline", as: :tameline
  get "/timelines/play_again_tam" => "timelines#play_again_tam", as: :play_again_tam

  get '/tfdstuff'    => 'tfd#tfdstuff'
  # get '/serve_media/:filename'  =>  'tfd#serve'
  match '/tfd/:name'  =>  'tfd#serve', :as => :custom_image, via: [:get, :post]

  resources :lectures do
    resources :topics
  end

  resources :topics, only: [:foo] do
    resources :streams
  end

  resources :streams, only: [] do
    resources :takes, only: [:create]
  end

  resources :streams, only: [] do
    resources :dummits
  end

  post 'takes/live_stream_start', as: 'live_stream_start'

  get '/auth/:provider/callback', to: 'yt_sessions#create'
  delete '/logout', to: 'yt_sessions#destroy', as: :logout

  resources :users, only: [:new, :create]

  resources :events, only: [:update]

  get '/', to: redirect('/events/index')
  get 'events/index'
  get 'events/update_topics', as: 'update_topics'
  get 'events/show'
  get 'events/yt1'
  get 'events/yt1_g'
  get 'events/yt1_get'
  get 'events/ytv3'
  get 'events/ytv3_1'
  get 'events/ytv3_1_g'

  resources :sessions, only: [:new, :create, :destroy] do
    delete :destroy, on: :collection
  end

end
