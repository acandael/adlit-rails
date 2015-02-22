require 'rails_helper'

describe "Deleting a member" do

  let(:user) { User.create!(user_attributes) }
  let!(:member) { Member.create!(member_attributes) } 

  before do
    sign_in(user)
    visit admin_members_path
    click_link 'Delete'
  end

  it "destroys the member and shows the members listing without the deleted member" do
    expect(page).not_to have_text(member.name)
    expect(page).to have_text("Member successfully deleted!")
  end
end

