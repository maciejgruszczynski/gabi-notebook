# frozen_string_literal: true


Rails.application.routes.draw do
  
  resources :search_notebooks do
    collection do
      post :search, to: "search_notebooks#search"
    end
  end

  resources :hn_search_results, only: :index do
    collection do
      post :search, to: "hn_search_results#search"
    end
  end
  
  root 'home#show'

end
