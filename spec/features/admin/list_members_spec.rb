require 'rails_helper'

describe "Viewing the list of members" do

  let(:user) { User.create!(user_attributes) }

  let!(:member1) { Member.create!(member_attributes(name: "Liselot Hudders")) }

  let!(:member2) { Member.create!(member_attributes(name: "Katarina Panic", email: "katarina.panic@ugent.be")) }

  let!(:member3) { Member.create!(member_attributes(name: "Pieter De Pauw Panic", email: "pieter.depauw@ugent.be")) }

  before do
    sign_in(user)
    visit admin_members_path
  end

  it "shows the members" do
    expect(page).to have_text(member1.name)
    expect(page).to have_text(member2.name)
    expect(page).to have_text(member3.name)
  end
end

