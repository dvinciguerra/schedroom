Rails.application.routes.draw do

	# backend (application api)
  namespace :api do
    namespace :v1 do
      post '/user-token', as: 'user_token', to: 'user_token#create'
      get '/user-profile', to: 'user_profile#index'

      resource '/room-schedule',
               as: 'room_schedule',
               controller: 'room_schedule',
               only: %i[index show create update destroy]
    end
  end

	# frontend (web interface)
  root to: 'home#index'
end
