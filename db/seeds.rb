def rand_paragraphs(min, max)
  Faker::Lorem.paragraphs(rand(min..max)).join("\n\n")
end

def rand_assets(min, max, ext)
  rand(min..max).times.map do |i|
    {
      filename: "#{i}.#{ext}"
    }
  end
end

# Ingersoll Rand brands
Company.create([
  {
    name: "ModWerks",
    path_show: "/",
    slogan: "coming soon™"
  },
  {
    name: "HTS",
    path_show: "http://www.hts.com/",
    slogan: "Delivering Real Success®"
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

products = Product.create(20.times.map {
  {
    type: ["Good", "Mod"].sample,
    name: Faker::Commerce.product_name,
    info: rand_paragraphs(1, 3)
  }
})

products.each do |product|
  product.specs.create(rand(1..3).times.map { |i|
    {
      title: "Spec-#{i}",
      body: rand_paragraphs(1, 5),
    }
  })
  product.specs.each do |spec|
    spec.images.create(rand_assets(0, 3, ["gif", "png", "jpg"].sample)) 
    spec.pdfs.create(rand_assets(0, 1, "pdf")) 
  end

  product.images.create(rand_assets(1, 5, ["gif", "png", "jpg"].sample))
  product.pdfs.create(rand_assets(0, 3, "pdf"))
end

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

Spec.create({
  title: "About Us",
  body: rand_paragraphs(1, 5),
})

# HomePageImage.create([
#   {
#     filename:
#   }

# ])


