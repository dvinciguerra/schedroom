Rails.application.routes.draw do
  # backend (application api)
  namespace :api do
    namespace :v1 do
      post :user_token,
           path: '/user-token', to: 'user_token#create'

      get '/user-profile', to: 'user_profile#index'

      resources :room_schedule,
               path: '/room-schedules', only: %i[create index show destroy]
    end
  end

  # frontend (web interface)
  root to: 'home#index'
  get 'auth/signin'
end
