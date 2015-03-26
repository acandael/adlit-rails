require 'rails_helper'

describe "viewing the list of team members" do
  it "shows the team members" do
    member1 = Member.create!(member_attributes(name: 'liselot', email: 'liselot@ugent.be'))

    member2 = Member.create!(member_attributes(name: 'katarina', email: 'katarina@ugent.be'))

    member3 = Member.create!(member_attributes(name: 'pieter', email: 'pieter@ugent.be'))

    visit team_path

    expect(page).to have_text(member1.name)
    expect(page).to have_text(member2.name)
    expect(page).to have_text(member3.name)
    expect(page).to have_text(member1.affiliation)
    expect(page).to have_selector("img[src$='#{member1.image}']")
    expect(page).to have_text(member1.organization)
  end

  it "orders the members by position" do
    member1 = Member.create!(member_attributes(name: "liselot", email: "liselot@ugent.be", organization: "universiteit gent", position: 3))
    member2 = Member.create!(member_attributes(name: "pieter", email: "pieter@ugent.be", organization: "katholieke universiteit leuven", position: 1))
    member3 = Member.create!(member_attributes(name: "daniel", email: "daniel@ugent.be", organization: "universiteit antwerpen", position: 2))

    visit team_path

    expect(Member.order_by_position).to eq([member2, member3, member1])
  end
end

