# frozen_string_literal: true

Rails.application.routes.draw do
  
  resources :forums
  resources :reviews
  #get 'inscriptions/new'
  #get 'inscriptions/show'
  #get 'inscriptions/create'
  #get 'inscriptions/index'
  #get 'inscriptions/edit'
  #get 'inscriptions/update'
  #get 'inscriptions/destroy'
  
  resources :inscriptions

  root to: 'courses#index'

  resources :courses 

  devise_for :users, controllers:
  {
    sessions: 'users/sessions', registrations: 'users/registrations'
  },
                     path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' } 

  ######### ROOT #########

  ######### CREATE #########
  #get 'courses/new'
  #post 'courses', to: 'courses#create'

  get 'lessons/new'
  post 'lessons', to: 'lessons#create'

  # get 'inscriptions/new'
  # post 'inscriptions', to: 'inscriptions#create'

  ######### READ #########
  #get 'courses/index'
  #get 'courses/show'

  get 'lessons/index'
  get 'lessons/show'

  # get 'inscriptions/index'
  # get 'inscriptions/show'

  get 'articles/index'

  get 'users/:id', to: 'users#show', as: 'users_show'

  ######### UPDATE #########
  #get 'courses/edit'
  #patch 'courses/update', to: 'courses#update', as: 'courses_update'

  get 'lessons/edit'
  patch 'lessons/update', to: 'lessons#update', as: 'lessons_update'

  # get 'inscriptions/edit'
  # patch 'inscriptions/update', to: 'inscriptions#update', as: 'inscriptions_update'


  ######### DELETE #########
  #delete 'courses/delete', to: 'courses#delete', as: 'courses_delete'
  delete 'lessons/delete', to: 'lessons#delete', as: 'lessons_delete'

  # delete 'inscriptions/delete', to: 'inscriptions#delete', as: 'inscriptions_delete'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end