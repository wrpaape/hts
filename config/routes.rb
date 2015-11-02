Rails.application.routes.draw do

  # resources :products, controller: "products", type: "Product"
  # scope :products do
  #   resources :custom_metal_products, as: "custom_metal_products", type: "CMProduct"
  #   resources :extended_gas_sections, as: "extended_gas_sections", type: "ExtGasSec"
  #   resources :high_performance_ahus, as: "high_performance_ahus", type: "HighPerfAHU"
  #   resources :low_profile_ervs, as: "low_profile_ervs", type: "LowProfileERV"
  #   resources :multi_zone_vavs, as: "multi_zone_vavs", type: "MultiZoneVAV"
  #   resources :vrv_accessories, as: "vrv_accessories", type: "VRVAcc"
  # end
  
  # resources :modifications, controller: "products", type: "Modification"
  # scope :modifications do
  #   resources :equipment_screens, as: "equipment_screens", controller: "products", type: "EquipScreen"
  # end

  # resources :documents, type: "Document"
  # scope :documents do
  #   resources :catalogs, as: "catalogs", controller: "documents", type: "Catalog"
  #   resources :drawings, as: "drawings", controller: "documents", type: "Drawing"
  #   resources :installation_manuals, as: "installation_manuals", controller: "documents", type: "InstallManual"
  #   resources :parts_lists, as: "parts_lists", controller: "documents", type: "PartsList"
  # end
  
  # scope :search do
  #   get "products", to: "search#search", as: "search_products", type: "Product"
  #   get "extended_gas_sections", to: "search#search", as: "search_extended_gas_sections", type: "ExtGasSec"
  #   get "custom_metal_products", to: "search#search", as: "search_custom_metal_products", type: "CMProduct"
  #   get "equipment_screens", to: "search#search", as: "search_equipment_screens", type: "EquipScreen"
  #   get "vrv_accessories", to: "search#search", as: "search_vrv_accessories", type: "VRVAcc"
  #   get "modifications", to: "search#search", as: "search_modifications", type: "Modification"
  #   get "documents", to: "search#search", as: "search_documents", type: "Document"
  #   get "drawings", to: "search#search", as: "search_drawings", type: "Drawing"
  #   get "installation_manuals", to: "search#search", as: "search_installation_manuals", type: "InstallManual"
  #   get "parts_lists", to: "search#search", as: "search_parts_lists", type: "PartsList"
  #   root "search#search", as: "search", type: "SearchController"
  # end

  concern :searchable do
    get "/search", to: "search#search", on: :collection
  end

  resources :products,
    :modifications,
    :custom_metal_products,
    :extended_gas_sections,
    :high_performance_ahus,
    :low_profile_ervs,
    :multi_zone_vavs,
    :vrv_accessories,
    :equipment_screens,
    :documents,
    :catalogs,
    :drawings,
    :installation_manuals,
    :parts_lists,
    :employees, concerns: :searchable

  get "/search", to: "search#search"

  namespace :download do
    get "pdfs/:id", to: "#pdf", as: "pdf"
  end

  root "main#index"
end
