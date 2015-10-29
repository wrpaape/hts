if Rails.env.development?
  # sti_models = {
  #   "products"=> %w(product good mod cm_product equip_screen ext_gas_sec),
  #   "documents"=> %w(document catalog drawing install_manual parts_list),
  #   "texts"=> %w(text about_us)
  #   # "contacts": %w(contact address email phone mobile_phone office_phone toll_free_phone)
  #   # "assets": %w(asset pdf image logo home_page_image head_shot about_us_image)
  # }
  # sti_models.each do |table, filenames|
  #   filenames.each { |f| require_dependency File.join("app", "models", table, "#{f}.rb") }
  # end
end