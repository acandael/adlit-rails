require 'rails_helper'

describe "Deleting a member" do
  it "destroys the member and shows the members listing without the deleted member" do

    member = Member.create!(member_attributes) 
    
    visit admin_members_path

    click_link 'Delete'

    expect(current_path).to eq(admin_members_path)
    expect(page).not_to have_text(member.name)
    expect(page).to have_text("Member successfully deleted!")
  end
end

