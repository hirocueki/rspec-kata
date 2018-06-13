Rails.application.routes.draw do
  resources :projects
  root 'homes#index'
end
