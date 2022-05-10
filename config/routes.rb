Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  get 'homes/top'
  get 'homes/bout'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
