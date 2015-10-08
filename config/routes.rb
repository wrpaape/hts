Rails.application.routes.draw do
  resources :goods, controller: "products", type: "Good"
  resources :mods, controller: "products", type: "Mod"

  root 'main#index'
end
