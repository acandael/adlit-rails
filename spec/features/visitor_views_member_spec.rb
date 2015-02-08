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
end

