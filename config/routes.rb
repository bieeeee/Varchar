Rails.application.routes.draw do
  devise_for :users
  root to: "characters#index"
  resources :characters, except: [:destroy] do
    resources :bookings, except: [:index, :show, :destroy, :edit, :update]
  end
  get '/bookings/:id', to: "bookings#show", as: :booking
  delete '/bookings/:id/edit', to: "bookings#destroy", as: :delete_booking
  get '/my-bookings', to: "bookings#my_bookings"
  get '/my-characters', to: "characters#my_characters"
  delete '/my-characters/:id', to: "characters#destroy", as: :delete_character
  get '/host-bookings/:id', to: "bookings#host_booking"
  patch '/host-bookings/:id/:status/set-status', to: "bookings#set_status", as: :edit_status
  get '/host-bookings', to: "bookings#host_bookings"
  get 'bookings/:id/edit', to: "bookings#edit", as: :edit_booking
end
