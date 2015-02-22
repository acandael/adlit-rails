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

  it "orders the members by organization" do
    member1 = Member.create!(member_attributes(name: "liselot", email: "liselot@ugent.be", organization: "universiteit gent"))
    member2 = Member.create!(member_attributes(name: "pieter", email: "pieter@ugent.be", organization: "katholieke universiteit leuven"))
    member3 = Member.create!(member_attributes(name: "daniel", email: "daniel@ugent.be", organization: "universiteit antwerpen"))

    visit team_path

    expect(Member.by_organization).to eq([member2, member3, member1])
  end
end

