Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'pages#home'
  resources :classrooms, only: [ :show, :index ] do
    resources :questions, only: [ :index, :new, :create, :edit, :update ]
  end

  resources :questions  do
    resources :alternatives, only: [ :new, :create ]
  end

  resources :questions, only: [ :show, :destroy ]
  resources :alternatives, only: [ :edit, :delete ]

  patch "questions/:id/send", to: "questions#send_question", as: :send_question
  get "classrooms/:id/dashboard", to: "classrooms#dashboard", as: :dashboard
  get "classrooms/:id/feed", to: "classrooms#feed", as: :feed
  post "alternatives/:id/answers", to: "answers#create", as: :create_answer
end
