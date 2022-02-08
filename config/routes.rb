# frozen_string_literal: true


Rails.application.routes.draw do
  
  resources :search_notebooks
  
  root 'home#show'

end
