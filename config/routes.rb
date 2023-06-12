Rails.application.routes.draw do
  root 'qr_codes#new'
  resources :qr_codes, only: [:new, :create, :show]
end
