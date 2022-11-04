Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
namespace "api" do
  namespace "v1" do
    scope "categories" do
      get "index", to: "categories#index"
      get "show/:id", to: "categories#show"
      post "create", to: "categories#create"
      patch "update/:id", to: "categories#update"
      delete "delete/:id", to: "categories#delete"
    end
    scope "brands" do
      get "index", to: "brands#index"
      get "show/:id", to: "brands#show"
      post "create", to: "brands#create"
      patch "update/:id", to: "brands#update"
      delete "delete/:id", to: "brands#delete"
    end
    scope "products" do
      get "index", to: "products#index"
    end
  end
end
end