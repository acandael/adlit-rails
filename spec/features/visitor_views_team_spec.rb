require 'rails_helper'

describe "viewing the list of team members" do
  it "shows the team members" do
    member1 = Member.create!(name: "Liselot Hudders",
                             image: "liselot.hudders.jpg",
                             email: "liselot.hudders@ugent.be",
                             phone: "09 264 91 89",
                             organization: "Universiteit Gent",
                             address: "Vakgroep Communicatiewetenschappen Korte Meer 11,                                     9000 Gent",
                             affiliation: "Center for Persuasive Communication",
                             link: "http://www.cepec.ugent.be")

    member2 = Member.create!(name: "Katarina Panic",
                             image: "katarina.panic.jpg",
                             email: "katarina.panic@ugent.be",
                             phone: "32 9 264 67 98",
                             organization: "Universiteit Antwerpen",
                             address: "Department of Media Studies,                                     9000 Gent",
                             affiliation: "Center for Journalism Studies",
                             link: "http://www.cjs.ugent.be")

    member3 = Member.create!(name: "Pieter De Pauw Panic",
                             image: "pieter.jpg",
                             email: "pieter.depauw@ugent.be",
                             phone: "32 9 264 34 56",
                             organization: "Katholieke Universiteit Leuven",
                             address: "Departement of Marketing, 3000 Leuven",
                             affiliation: "Center for Marketing Studies",
                             link: "http://www.cjs.ugent.be")

    visit team_path

    expect(page).to have_text(member1.name)
    expect(page).to have_text(member2.name)
    expect(page).to have_text(member3.name)
    expect(page).to have_text(member1.affiliation)
    expect(page).to have_selector("img[src$='#{member1.image}']")
    expect(page).to have_text(member1.organization)
  end
end

