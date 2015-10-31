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

label = ->(i) { "#{class_type_display.singularize} #{i}" }
attr_keys = -> { /prods/ === table_name ? [:name, :info, :model_number] : [:title, :body] }
doc_vals = ->(i) { [class_exec(i, &label), rand_paragraphs(1, 3)] }
prod_vals = ->(i) { class_exec(i, &doc_vals).push(rand_model_number) }
attr_vals = ->(i) { class_exec(i, &(/prods/ === table_name ? prod_vals : doc_vals)) }
attrs = ->(i) { Hash[class_exec(&attr_keys).zip(class_exec(i, &attr_vals))] }
gen_pdfs = ->(docs) { docs.pdfs.create(rand_assets(10, 20, "pdf")) }
gen_doc = ->(i) { create(class_exec(i, &attrs)) }
gen_docs = -> { rand(10..20).times.map { |i| docs << Doc.descendants.sample.class_exec(i, &gen_doc) } }
gen_prods = ->(num) { num.times { |i| create(class_exec(i, &attrs)).instance_exec(&gen_docs) } }
seed = -> { class_exec(include?(SingletonRecord) ? 1 : rand(10..20), &gen_prods); all.each(&gen_pdfs) }

Prod.descendants.each { |prod| prod.class_exec(&seed) }


home_page_attrs = ->(name) { { name: name, info: rand_paragraphs(1, 3), model_number: rand_model_number } }
gen_home_page_inst = -> { create(home_page_attrs.call(class_type_display)); last.images.create(type: "HomePageImage") }

[Modification, EquipScreen, LowProfileERV, MultiZoneVAV, HighPerfAHU, ExtGasSec].each { |prod| prod.class_exec(&gen_home_page_inst) }

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

