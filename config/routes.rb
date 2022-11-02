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
  end
end
end