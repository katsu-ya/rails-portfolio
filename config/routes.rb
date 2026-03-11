 Rails.application.routes.draw do

   resources :board_messages
   resources :board_users
   resources :users, only: [:new, :create, :edit, :update]

   root "board_messages#index"

   resource :session

   resource :password, only: [:new, :create]

   get  "/password/edit/:token",   to: "passwords#edit",   as: :edit_password
   patch "/password/update/:token", to: "passwords#update", as: :update_password

  
   get "blogs/index"
   get "blogs/show"
   get "blogs/new"

   resources :answers
   resources :questions
   resources :mycontacts


  resources :people do
    resources :messages, shallow: true
  end

  
  resources :posts, controller: "blogs" do
    resources :comments, only: [ :create ]
  end

  # config/routes.rb
resources :posts do
  resources :comments, only: [:create]
end


  get "msgboard", to: "msgboard#index"
  post "msgboard", to: "msgboard#index"
  get "msgboard/index"
  post "msgboard/index"


end
