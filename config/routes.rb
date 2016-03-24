Rails.application.routes.draw do
  #mount TalkingStick::Engine, at: '/talking_stick'
  root "home#index"
  get "/teste"  => "home#teste"



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

  # post 'takes/takes_start_yt_live_stream', as: 'takes_start_yt_live_stream'

  post 'streams/start_yt_live', as: 'start_yt_live'
  post 'streams/capture_tam/:id', to: 'streams#capture_tam', as: 'capture_tam'

  get '/auth/:provider/callback', to: 'yt_sessions#create'
  delete '/logout', to: 'yt_sessions#destroy', as: :logout

  resources :users, only: [:new, :create]

  resources :events, only: [:update]

  get '/', to: redirect('/events/index')
  get 'events/index'
  get 'events/update_topics', as: 'update_topics'
  get 'events/show'

  get 'lego/components', to: 'lego#components', as: 'components'

  resources :sessions, only: [:new, :create, :destroy] do
    delete :destroy, on: :collection
  end

end
