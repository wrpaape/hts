Rails.application.routes.draw do
  resources :products, controller: "products", type: "Good"
  # scope :products do
  #   resources :air_conditioners, as: "acs", type: "Ac"
  # end
  resources :modifications, controller: "products", type: "Mod"

  root 'main#index'
end
