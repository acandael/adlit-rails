require 'rails_helper'

describe "Viewing the list of members" do

  let(:user) { User.create!(user_attributes) }

  let!(:member1) { Member.create!(member_attributes(name: "Pieter De Pauw Panic", email: "pieter.depauw@ugent.be")) }

  let!(:member2) { Member.create!(member_attributes(name: "Katarina Panic", email: "katarina.panic@ugent.be")) }

  let!(:member3) { Member.create!(member_attributes(name: "Liselot Hudders")) }


  before do
    sign_in(user)
    visit admin_members_path
  end

  it "shows the members" do
    expect(page).to have_text(member1.name)
    expect(page).to have_text(member2.name)
    expect(page).to have_text(member3.name)
  end

  it "shows the members in alfabetical order" do
    expect(Member.by_name).to eq([member2, member3, member1])
  end
end

