# frozen_string_literal: true


Rails.application.routes.draw do
  
  resources :search_notebooks do
    collection do
      post :search, to: "search_notebooks#search"
    end
  end
  
  root 'home#show'

end
