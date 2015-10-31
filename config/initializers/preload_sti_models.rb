if Rails.env.development?
  sti_models = {
    "prods"=> %w(prod product modification cm_product equip_screen ext_gas_sec multi_zone_vav vrv_acc),
    "docs"=> %w(doc document catalog drawing install_manual parts_list),
    "texts"=> %w(text about_us)
    # "contacts": %w(contact address email phone mobile_phone office_phone toll_free_phone)
    # "assets": %w(asset pdf image logo home_page_image head_shot about_us_image)
  }
  sti_models.each do |table, filenames|
    filenames.each { |f| require_dependency File.join("app", "models", table, "#{f}.rb") }
  end
end