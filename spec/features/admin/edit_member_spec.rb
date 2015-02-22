require 'rails_helper'

describe "Editing a member" do
  
  let(:user) { User.create!(user_attributes) }
  let!(:member) { Member.create!(member_attributes) }

  before do
    sign_in(user)
    visit admin_members_path
    click_link 'Edit'
  end

  it "updates the member and shows the members updated details" do
    fill_in_form(name: "new name", email: "updated@email.com")

    expect(page).to have_text('Member successfully updated')
  end

  it "shows the updated member details" do
    fill_in_form(name: "new name", email: "updated@email.com")
    member.reload

    click_link member.name

    expect(page).to have_text('new name')
    expect(page).to have_text('updated@email.com')
  end

  it "does not update the member if it's invalid" do
    fill_in_form(name: " ", email: "updated@email.com")

    expect(page).to have_text('error')
  end

  def fill_in_form(fields = {})
    fill_in 'Name', with: fields[:name] 
    fill_in 'Email', with: fields[:email] 
    click_button 'Update Member'
  end
end

