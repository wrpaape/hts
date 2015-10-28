Rails.application.routes.draw do
  resources :products, controller: "products", type: "Good"
  scope :products do
    resources :extended_gas_sections, as: "extended_gas_sections", controller: "products", type: "ExtGasSec"
    resources :vrv_accessories, as: "vrv_accessories", controller: "products", type: "VRVAcc"
  end
  
  resources :modifications, controller: "products", type: "Mod"
  scope :modifications do
    resources :equipment_screens, as: "equipment_screens", controller: "products", type: "EquipScreen"
  end

  resources :documents, type: "Document"
  scope :documents do
    resources :catalogs, as: "catalogs", controller: "documents", type: "Catalog"
    resources :drawings, as: "drawings", controller: "documents", type: "Drawing"
    resources :installation_manuals, as: "installation_manuals", controller: "documents", type: "InstallManual"
    resources :parts_lists, as: "parts_lists", controller: "documents", type: "PartsList"
  end

  resources :employees

  scope :download do
    get "pdf/:id", to: "download#pdf", as: "download_pdf"
  end

  scope :search do
    get "products", to: "search#search", as: "search_products", type: "Good"
    get "extended_gas_sections", to: "search#search", as: "search_extended_gas_sections", type: "ExtGasSec"
    get "custom_metal_products", to: "search#search", as: "search_custom_metal_products", type: "CMProduct"
    get "equipment_screens", to: "search#search", as: "search_equipment_screens", type: "EquipScreen"
    get "vrv_accessories", to: "search#search", as: "search_vrv_accessories", type: "VRVAcc"
    get "modifications", to: "search#search", as: "search_modifications", type: "Mod"
    get "documents", to: "search#search", as: "search_documents", type: "Document"
    get "drawings", to: "search#search", as: "search_drawings", type: "Drawing"
    get "installation_manuals", to: "search#search", as: "search_installation_manuals", type: "InstallManual"
    get "parts_lists", to: "search#search", as: "search_parts_lists", type: "PartsList"
    root "search#search", as: "search", type: "SearchController"
  end

  root "main#index"
end
