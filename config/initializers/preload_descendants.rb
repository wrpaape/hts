if Rails.env.development?
  sti_models = {
    "products"=>
      %w(product
        modification
        custom_metal_product
        equipment_screen
        extended_gas_section
        multi_zone_vav
        low_profile_erv
        vrv_accessory
        high_performance_ahu),
    "documents"=>
      %w(document
        catalog
        drawing
        installation_manual
        parts_list)
    # "assets"=>
    #   %w(asset
    #     about_us_image
    #     head_shot
    #     home_page_image
    #     image
    #     logo
    #     pdf),
    # "texts"=>
    #   %w(text
    #     about_us),
    # "contacts"=>
    #   %w(contact
    #     address
    #     email
    #     phone
    #     mobile_phone
    #     office_phone
    #     toll_free_phone)
  }

  sti_models.each do |table, filenames|
    filenames.each { |f| require_dependency File.join("app", "models", table, "#{f}.rb") }
  end
  
  require_dependency File.join("app", "controllers", "products_controller.rb")
end