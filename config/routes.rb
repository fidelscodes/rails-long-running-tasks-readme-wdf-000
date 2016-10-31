Rails.application.routes.draw do
  resources :customers, only: [:index]

  # route to take the file updload
  post 'customers/upload', to: 'customers#upload'
end
