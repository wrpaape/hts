# Ingersoll Rand brands
Brand.create([
	{
    name: "Club Car",
    filename: "club_car",
    link: "http://www.clubcar.com/us/en/home.html"
  },
  {
    name: "Ingersoll Rand",
    filename: "ingersoll_rand",
    link: "http://company.ingersollrand.com/ircorp/en/index.html"
  },
  {
    name: "Thermo King",
    filename: "thermo_king",
    link: "http://www.thermoking.com/"
  }
])

# team members and their contacts
Member.create([
  {
    name: "Dean Revering",
    filename: "dean_revering",
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
    filename: "kevin_baxter",
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
    filename: "wally_bomhoff",
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

Unit.create([

])