Rails.application.routes.draw do
  root "articles#index"

  get "/articles", to: "articles#index"

  get "/about", to: "public#about"

  get "/about/author", to: "public#author"
end