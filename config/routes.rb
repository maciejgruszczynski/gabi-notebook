# frozen_string_literal: true


Rails.application.routes.draw do
  
  resources :search_notebooks do
    collection do
      post :search, to: "search_notebooks#search"
    end
  end

  resources :hn_search_results, only: :index
  post :search_api, to: "hn_search_results#search"
  post :add_to_notebook, to: 'search_results#create'
  
  root 'home#show'

end
