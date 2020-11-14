Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "classrooms#index"
  resources :classrooms, only: [ :show ] do
    resources :questions, only: [ :new, :create ] do
      resources :alternatives, only: [ :new, :create ]
    end
  end

  resources :questions, only: [ :show, :edit, :destroy ]
  resources :alternatives, only: [ :edit, :destroy ]

  patch "questions/:id/send", to: "questions#send", as: :send_question
  get "classrooms/:id/dashboard", to: "classrooms#dashboard", as: :dashboard
  get "classrooms/:id/feed", to: "classrooms#feed", as: :feed
  post "alternatives/:id/answers/create", to: "alternatives#create", as: :create_answer
end
