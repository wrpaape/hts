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
    link: "/"
  },
	{
    name: "HTS",
    link: "http://www.hts.com/"
  },
  {
    name: "Thermo King",
    link: "http://www.thermoking.com/"
  }
])

# team members and their contacts
Employee.create([
  {
    name: "Dean Revering",
    title: "Account Executive",
    contacts: Contact.create([
      {
        type: "Email",
        address: "dean_revering@example.com"
      },
      {
        type: "Phone",
        number: "(512)459-2222"
      },
      {
        type: "Fax",
        number: "(513)459-2222"
      }
    ]),
    bio:
"""
Franchise apophenia knife tiger-team drone convenience store silent
hotdog geodesic euro-pop BASE jump long-chain hydrocarbons receding.
Math-assault woman pen disposable A.I. alcohol neon sprawl
tank-traps city neural pistol savant rifle apophenia. Voodoo god
tanto semiotics grenade Kowloon tank-traps sub-orbital woman
towards savant media dissident. Claymore mine nano-narrative into
Kowloon ablative corrupted hacker sentient assassin warehouse. 
"""
  },
  {
    name: "Ross Wojcik",
    title: "Director of ModWerks",
    contacts: Contact.create([
      {
        type: "Email",
        address: "ross.wojcik@hts.com"
      },
      {
        type: "Mobile",
        number: "(502)939-4110"
      },
      {
        type: "Office",
        number: Number.create(value: "(512)381-0091"),
        extension: Extension.create(value: "1218")
      }
    ]),
    bio:
"""
Franchise apophenia knife tiger-team drone convenience store silent
hotdog geodesic euro-pop BASE jump long-chain hydrocarbons receding.
Math-assault woman pen disposable A.I. alcohol neon sprawl
tank-traps city neural pistol savant rifle apophenia. Voodoo god
tanto semiotics grenade Kowloon tank-traps sub-orbital woman
towards savant media dissident. Claymore mine nano-narrative into
Kowloon ablative corrupted hacker sentient assassin warehouse. 
"""
  },
  {
    name: "Wally Bomhoff",
    title: "South Texas Area Manager",
    contacts: Contact.create([
        {
          type: "Email",
          address: Address.create(value: "walter.bomhoff@trane.com")
        }
      ]),
    bio:
"""
Franchise apophenia knife tiger-team drone convenience store silent
hotdog geodesic euro-pop BASE jump long-chain hydrocarbons receding.
Math-assault woman pen disposable A.I. alcohol neon sprawl
tank-traps city neural pistol savant rifle apophenia. Voodoo god
tanto semiotics grenade Kowloon tank-traps sub-orbital woman
towards savant media dissident. Claymore mine nano-narrative into
Kowloon ablative corrupted hacker sentient assassin warehouse. 
"""
  }
])

products = Product.create(20.times.map {
  {
    type: ["Good", "Mod"].sample,
    name: Faker::Commerce.product_name,
    info: Faker::Lorem.paragraphs(rand(1..3)).join("\n\n")
  }
})

products.each do |product|
  product.specs.create(rand(1..3).times.map { |i|
    {
      title: "Spec-#{i}",
      body: Faker::Lorem.paragraphs(rand(1..5)).join("\n\n"),
    }
  })
  product.specs.each do |spec|
    spec.images.create(rand_assets(0, 3, ["gif", "png", "jpg"].sample)) 
    spec.pdfs.create(rand_assets(0, 1, "pdf")) 
  end

  product.images.create(rand_assets(1, 5, ["gif", "png", "jpg"].sample))
  product.pdfs.create(rand_assets(0, 3, "pdf"))
end