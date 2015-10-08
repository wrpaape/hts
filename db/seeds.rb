# Ingersoll Rand brands
Brand.create([
	{
    name: "Club Car",
    link: "http://www.clubcar.com/us/en/home.html"
  },
  {
    name: "Ingersoll Rand",
    link: "http://company.ingersollrand.com/ircorp/en/index.html"
  },
  {
    name: "Thermo King",
    link: "http://www.thermoking.com/"
  }
])

# team members and their contacts
Member.create([
  {
    name: "Dean Revering",
    title: "Account Executive",
    contacts: Contact.create([
        {
          type: "email",
          info: "dean_revering@example.com"
        },
        {
          type: "phone",
          info: "(111)-111-1111"
        },
        {
          type: "fax",
          info: "(222)-222-2222"
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
    name: "Kevin Baxter",
    title: "General District Manager",
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
          type: "email",
          info: "walter.bomhoff@trane.com"
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

Product.create(
  20.times.map do
    {
      type: Product.subclasses.sample.to_s,
      name: Faker::Commerce.product_name,
      info: Faker::Lorem.paragraphs(rand(1..3)).join('\n\n'),
      images: Image.create(rand(1..5).times.map { |i|
        {
          filename: "image-#{i}.#{["gif", "png", "jpg"].sample}"
        }
      })
      pdfs: Pdf.create(rand(0..3).times.map { |i|
        {
          filename: "#{i}.pdf"
        }
      }),
      specs: Spec.create(rand(1..3).times.map { |i|
        {
          title: "Spec-#{i}",
          body: Faker::Lorem.paragraphs(rand(1..5)).join('\n\n'),
          images: Image.create()
        }
      })
    }
  end
  )
