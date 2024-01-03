Rails.application.routes.draw do

  root to: "scraping#index"

  post "/scrape", to: "scraping#scrape", as: "scraping_create"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
