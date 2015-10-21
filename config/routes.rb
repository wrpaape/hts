Rails.application.routes.draw do
  resources :products, controller: "products", type: "Good"
  scope :products do
    resources :extended_gas_sections, as: "extended_gas_sections", type: "ExtGasSec"
  end
  
  resources :modifications, controller: "products", type: "Mod"
  scope :modifications do
    resources :equipment_screens, as: "equipment_screens", type: "EquipScreen"
  end

  resources :employees

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
