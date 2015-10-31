include Rails.application.routes.url_helpers

def rand_model_number
  els = ([("A".."Z")] + [("0".."9")] * 10).flat_map(&:to_a)
  "#{rand(1..2).times.map { els.sample(rand(3..8)).join }.join("‐")}#{"‐#{rand(99)}" if rand > 0.8}"
end

def rand_paragraphs(min, max)
  Faker::Lorem.paragraphs(rand(min..max)).join("\n\n")
end

def big_paragraphs(num)
  num.times.map { Faker::Lorem.paragraphs(6).join }.join("\n\n")
end

def rand_assets(min, max, ext)
  rand(min..max).times.map do |i|
    {
      filename: "#{ext}-#{i}.#{ext}"
    }
  end
end

Company.create([
  {
    name: "ModWerks",
    path_show: "/",
    slogan: "coming soon™",
    contacts: Contact.create([
      {
        type: "Email",
        address: "texas@hts.com"
      },
      {
        type: "Phone",
        number: "(512)381-0091",
      },
      {
        type: "Address",
        line1: "6101 West Courtyard Dr., Building 4",
        line2: "Austin, Texas 78730",
      }
    ]),
  },
  {
    name: "HTS",
    path_show: "http://www.hts.com/",
    slogan: "Delivering Real Success®",
    contacts: Contact.create([
      {
        type: "Email",
        address: "texas@hts.com"
      },
      {
        type: "Phone",
        number: "(832)328-1010",
      },
      {
        type: "TollFreePhone",
        number: "(866)544-1487",
      },
      {
        type: "Fax",
        number: "(832)328-1460",
      },
      {
        type: "Address",
        line1: "3350 Yale Street",
        line2: "Houston, Texas 77018",
      }
    ])
  }
])

# team members and their contacts
Employee.create([
  {
    first_name: "Dean",
    last_name: "Revering",
    job_title: "Account Executive",
    contacts: Contact.create([
      {
        type: "Email",
        address: "dean_revering@example.com"
      },
      {
        type: "Phone",
        number: "(512)459-2222",
      },
      {
        type: "Fax",
        number: "(513)459-2222",
      }
    ]),
    bio: rand_paragraphs(1, 3)
  },
  {
    first_name: "Ross",
    last_name: "Wojcik",
    job_title: "Director of ModWerks",
    contacts: Contact.create([
      {
        type: "Email",
        address: "ross.wojcik@hts.com"
      },
      {
        type: "OfficePhone",
        number: "(512)381-0091",
        extension: "1218"
      },
      {
        type: "MobilePhone",
        number: "(502)939-4110",
      }
    ]),
    bio: rand_paragraphs(1, 3)
  }
])

# products = Product.create(4.times.map {
#   {
#     type: ["Good", "Mod"].sample,
#     name: Faker::Commerce.product_name,
#     info: rand_paragraphs(1, 3)
#   }
# })

# products.each do |product|
#   product.docs.create(rand(1..3).times.map { |i|
#     type = %w(Catalog Document Drawing InstallManual PartsList).sample

#     {
#       type: type,
#       title: "#{type.underscore}-#{i}",
#       body: rand_paragraphs(1, 5),
#     }
#   })
#   product.docs.each do |detail|
#     detail.images.create(rand_assets(0, 3, ["gif", "png", "jpg"].sample)) 
#     detail.pdfs.create(rand_assets(0, 1, "pdf")) 
#   end

#   product.images.create(rand_assets(1, 5, ["gif", "png", "jpg"].sample))
#   product.pdfs.create(rand_assets(0, 3, "pdf"))
# end

# [ExtGasSec, EquipScreen, VRVAcc, Catalog, Drawing, InstallManual, PartsList].each do |category_model|
#   keys = /products/ === category_model.table_name ? [:name, :info] : [:title, :body]
#   attrs = rand(1..3).times.map do |i|
#     Hash[keys.zip(["#{category_model.class_type_display.singularize} #{i}", rand_paragraphs(1, 3)])]
#   end
#     category_model.create(attrs)
# end

label = ->(i) { "#{class_type_display.singularize} #{i}" }
attr_keys = -> { is_a?(Prod) ? [:name, :info, :model_number] : [:title, :body] }
doc_vals = ->(i) { [instance_exec(i, &label), rand_paragraphs(1, 3)] }
prod_vals = ->(i) { instance_exec(i, &doc_vals).push(rand_model_number) }
attr_vals = ->(i) { instance_exec(i, &(is_a?(Prod) ? prod_vals : attr_vals)) }
attrs = ->(i) { Hash[instance_exec(&attr_keys).zip(instance_exec(i, &attr_vals))] }
gen_pdfs = -> { pdfs.create(rand_assets(10, 20, "pdf")) }
gen_doc = ->(i) { create(instance_exec(i, &attrs)).instance_exec(&gen_pdfs) }
gen_docs = -> { rand(10..20).times { |i| docs << Doc.descendants.sample.instance_exec(i, &gen_doc) } }
gen_prods = ->(num) { num.times { |i| create(instance_exec(i, &attrs)).instance_exec(&gen_docs) }
seed = -> { instance_exec(include?(SingletonRecord) ? 1 : rand(10..20), &gen_prods) }

Prod.descendants.each { |prod| prod.instance_exec(&seed) }

# CMProduct.create({
#   info: rand_paragraphs(1, 3)
# }).pdfs.create(filename: "0.pdf")

# Good.create({
#   name: "Multi-zone VAV",
#   info: rand_paragraphs(1, 3)
# })
# Good.last.pdfs.create(filename: "0.pdf")

# Good.create({
#   name: "Low Profile ERV",
#   info: rand_paragraphs(1, 3)
# }).images

# 6.times { |i| HomePageImage.create(caption: "Resize Test Filler-#{i}", path_link: "/") }

home_page_attrs = ->(name) { { name: name, info: rand_paragraphs(1, 3), model_number: rand_model_number } }
gen_home_page_inst = -> { create(home_page_attrs.call(class_type_display)).images.create(type: "HomePageImage") }
[Mod, EquipScreen, LowProfileERV, MultiZoneVAV, HighPerfAHU, ExtGasSec].each { |prod| prod.instance_exec(&gen_home_page_inst) }

# [Mod, EquipScreen, LowProfileERV, MultiZoneVAV, HighPerfAHU, ExtGasSec].each do |home_page_index_good|
#   HomePageImage.create({
#     caption: home_page_index_good.class_type_display,
#     path_link: send("#{home_page_index_good.category}_path")
#   })
# end

# Good.last(3).each { |home_page_good| home_page_good.images.create(type: "HomePageImage") }

AboutUs.create(body: big_paragraphs(2))

AboutUsImage.create([
  {
    description: "about us bg",
    class_name: "bg"
  },
  {
    description: "units assembled",
    class_name: "fg"
  },
  {
    description: "unit dismantled",
    class_name: "fg"
  }
])

AboutUs.take.images << AboutUsImage.all

