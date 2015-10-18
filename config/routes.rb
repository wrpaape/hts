Rails.application.routes.draw do
  resources :products, controller: "products", type: "Good"
  # scope :products do
  #   resources :air_conditioners, as: "acs", type: "Ac"
  # end
  resources :modifications, controller: "products", type: "Mod"
  resources :members
  scope :download do
    get "pdf/:id", to: "download#pdf", as: "download_pdf"
  end
  scope :search do
    get "products", to: "search#search", as: "products_search", type: "Good"
    get "modifications", to: "search#search", as: "modifications_search", type: "Mod"
    root "search#search", as: "search", type: "SearchController"
  end
  root "main#index"
end
