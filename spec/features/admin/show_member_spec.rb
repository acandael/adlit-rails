require 'rails_helper'

describe 'admin views an individual member' do

  let(:user) { User.create!(user_attributes) }
  let!(:member) { Member.create!(member_attributes) }

  before do
    sign_in(user)
  end

  it 'shows the member details' do
    visit admin_members_path

    click_link member.name

    expect(current_path).to eq(admin_member_path(member))
    expect(page).to have_text(member.name)
    expect(page).to have_text(member.function)
    expect(page).to have_text(member.email)
    expect(page).to have_text(member.phone)
    expect(page).to have_text(member.address)
    expect(page).to have_text(member.organization)
    expect(page).to have_link(member.affiliation)
  end
end
