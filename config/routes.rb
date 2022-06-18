Rails.application.routes.draw do
  scope module: :public do
    get 'posts/draft' => "posts#draft", as:"draft"
    resources :posts
    resources :users, only:[:update,:edit]
    get 'users/my_page' => "users#my_page", as:"my_page"
    get 'users/confirm' => "users#confirm", as:"confirm"
    patch 'users/withdraw' => "users#withdraw", as:"withdraw"
    root to:'homes#top'
    get 'homes/about'
    post '/guests/guest_sign_in', to: 'guests#new_guest'
  end
  namespace :admin do
    resources :posts, except:[:new, :create, :edit,:update]
    resources :categories, only:[:update, :show, :index, :edit]
    resources :users, except:[:destroy, :create, :new]
    root to:'homes#top'
    post '/guests/guest_sign_in', to: 'guests#new_guest'
  end

  devise_for :user, controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
 }
  devise_for :admin, controllers: {
  sessions: "admin/sessions"
 }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end