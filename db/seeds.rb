include Rails.application.routes.url_helpers

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

# Ingersoll Rand brands
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
    title: "Account Executive",
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
    title: "Director of ModWerks",
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
  },
  {
    first_name: "Walter",
    last_name: "bomhoff",
    title: "South Texas Area Manager",
    contacts: Contact.create([
        {
          type: "Email",
          address: "walter.bomhoff@trane.com"
        }
      ]),
    bio: rand_paragraphs(1, 3)
  }
])

products = Product.create(4.times.map {
  {
    type: ["Good", "Mod"].sample,
    name: Faker::Commerce.product_name,
    info: rand_paragraphs(1, 3)
  }
})

products.each do |product|
  product.documents.create(rand(1..3).times.map { |i|
    type = %w(Catalog Document Drawing InstallManual PartsList).sample

    {
      type: type,
      title: "#{type.underscore}-#{i}",
      body: rand_paragraphs(1, 5),
    }
  })
  product.documents.each do |detail|
    detail.images.create(rand_assets(0, 3, ["gif", "png", "jpg"].sample)) 
    detail.pdfs.create(rand_assets(0, 1, "pdf")) 
  end

  product.images.create(rand_assets(1, 5, ["gif", "png", "jpg"].sample))
  product.pdfs.create(rand_assets(0, 3, "pdf"))
end

Document.create({
  title: "About Us",
  body: rand_paragraphs(2, 5),
})

ExtGasSec.create({
  name: "Extended Gas Section X",
  info: rand_paragraphs(1, 3)
})

EquipScreen.create({
  name: "Equipment Screen X",
  info: rand_paragraphs(1, 3)
})

Good.create({
  name: "High Perf AHU",
  info: rand_paragraphs(1, 3)
})
Good.last.pdfs.create(filename: "0.pdf")

Good.create({
  name: "Multi-zone VAV",
  info: rand_paragraphs(1, 3)
})
Good.last.pdfs.create(filename: "0.pdf")

Good.create({
  name: "Low Profile ERV",
  info: rand_paragraphs(1, 3)
}).images

6.times { |i| HomePageImage.create(caption: "Resize Test Filler-#{i}", path_link: "/") }

HomePageImage.create([
  {
    caption: "Modifications",
    path_link: modifications_path
  },
  {
    caption: "Equipment Screens",
    path_link: equipment_screens_path
  },
  {
    caption: "Extended Gas Sections",
    path_link: extended_gas_sections_path
  }
])

Good.last(3).each { |home_page_good| home_page_good.images.create(type: "HomePageImage") }

AboutUs.create({
  body: big_paragraphs(2)
});

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

