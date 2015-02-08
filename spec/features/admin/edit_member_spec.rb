require 'rails_helper'

describe "Editing a member" do

  it "updates the member and shows the members updated details" do
    member = Member.create!(member_attributes) 
    
    visit admin_members_path

    click_link 'Edit'

    expect(current_path).to eq(edit_admin_member_path(member))
    expect(find_field('Name').value).to eq(member.name)

    fill_in 'Name', with: "Updated Member Name"

    click_button 'Update Member'

    expect(current_path).to eq(admin_members_path)
    expect(page).to have_text('Member successfully updated')

    member.reload

    click_link member.name

    expect(page).to have_text('Updated Member Name')

  end

  it "does not update the member if it's invalid" do
    member = Member.create!(member_attributes)

    visit edit_admin_member_path(member)

    fill_in 'Name', with: " "

    click_button 'Update Member'

    expect(page).to have_text('error')
  end
end

