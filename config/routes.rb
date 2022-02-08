# frozen_string_literal: true


Rails.application.routes.draw do
  root 'home#show'

  resources :search_notebooks
end
