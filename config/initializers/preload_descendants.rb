# if Rails.env.development?
#   nodes = [
#     {
#       step: "models",
#       leaves: %w(
#         asset
#         company
#         contact
#         document
#         employee
#         part
#         product
#         text
#       ),
#       children: [
#         {
#           step: "contacts",
#           leaves: %w(
#             address
#             email
#             phone
#           ),
#           children: [
#             {
#               step: "phones",
#               leaves: %w(
#                 mobile_phone
#                 office_phone
#                 toll_free_phone
#               )
#             }
#           ]
#         },
#         {
#           step: "texts",
#           leaves: %w(
#             about_us
#           )
#         },
#         {
#           step: "assets",
#           leaves: %w(
#             image
#             pdf
#           ),
#           children: [
#             {
#               step: "images",
#               leaves: %w(
#                 about_us_image
#                 head_shot
#                 home_page_image
#                 logo
#               )
#             }
#           ]
#         },
#         {
#           step: "documents",
#           leaves: %w(
#             catalog
#             drawing
#             installation_manual
#             parts_list
#           )
#         },
#         {
#           step: "products",
#           leaves: %w(
#             modification
#             custom_metal_product
#             equipment_screen
#             extended_gas_section
#             multi_zone_vav
#             low_profile_erv
#             vrv_accessory
#             high_performance_ahu
#           ),
#           children: [
#             {
#               step: "modifications",
#               leaves: %w(
#                 equipment_screen
#               )
#             }
#           ]
#         }
#       ]
#     }
#   ]

#   def require_tree(nodes, base)
#     nodes.try(:each) do |node|
#       begin
#         path = File.join(base, node[:step])
#         require_tree(node[:children], path)
#       rescue NameError
#         node[:leaves].each do |f|
#           require_dependency File.join(path, "#{f}.rb")
#         end

#         require_tree(node[:children], path)
#       end
#     end
#   end

#   require_tree(nodes, "app")
# end




