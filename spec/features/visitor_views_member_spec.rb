require 'rails_helper'

describe 'viewing an individual team member' do
  it 'shows the member details' do
    member = Member.create!(member_attributes) 

    visit team_path

    click_link member.name

    expect(current_path).to eq(member_path(member))
    expect(page).to have_text(member.name)
    expect(page).to have_selector("img[src$='#{member.image}']")
    expect(page).to have_text(member.email)
    expect(page).to have_text(member.phone)
    expect(page).to have_text(member.organization)
    expect(page).to have_text(member.address)
    expect(page).to have_link(member.affiliation)
  end

  it "includes the member's name in the page title" do
    member = Member.create!(member_attributes)

    visit member_path(member)

    expect(page).to have_title("AdLit - #{member.name}")
  end

  it "generates a slug when it's created" do
    member = Member.create!(member_attributes(name: "Daniel Biltereyst"))

    expect(member.slug).to eq("daniel-biltereyst")
  end

  it "requires a unique name" do
    member1 = Member.create!(member_attributes)

    member2 = Member.new(name: member1.name)
    member2.valid? # populates errors
    expect(member2.errors[:name].first).to eq("has already been taken")
  end

  it "requires a unique slug" do
    member1 = Member.create!(member_attributes)

    member2 = Member.new(slug: member1.slug)
    member2.valid? # populates errors
    expect(member2.errors[:slug].first).to eq("has already been taken")
  end

  it "orders the members by organization" do
    member1 = Member.create!(member_attributes(name: "liselot", email: "liselot@ugent.be", organization: "universiteit gent"))
    member2 = Member.create!(member_attributes(name: "pieter", email: "pieter@ugent.be", organization: "katholieke universiteit leuven"))
    member3 = Member.create!(member_attributes(name: "daniel", email: "daniel@ugent.be", organization: "universiteit antwerpen"))

    visit team_path

    expect(Member.by_organization).to eq([member2, member3, member1])
  end
end

