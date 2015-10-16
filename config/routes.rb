Rails.application.routes.draw do
  resources :products, controller: "products", type: "Good"
  # scope :products do
  #   resources :air_conditioners, as: "acs", type: "Ac"
  # end
  resources :modifications, controller: "products", type: "Mod"
  resources :members
  get "download_pdf/:id", to: "main#download_pdf", as: "download_pdf"
  scope :search do
    get "products", to: "search#search", as: "products_search", type: "Good"
    get "modifications", to: "search#search", as: "modifications_search", type: "Mod"
    root "search#search", as: "search"
  end
  root "main#index"
end
