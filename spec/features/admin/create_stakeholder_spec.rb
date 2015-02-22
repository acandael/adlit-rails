require 'rails_helper'

describe "Creating a new stakeholder" do

  let(:user) { User.create!(user_attributes) } 
  before do
    sign_in(user)
    Field.create!(name: "onderwijs")
    Field.create!(name: "media")
    visit admin_stakeholders_path
    click_button 'Add New Stakeholder'
  end

  it "saves the stakeholder" do
    fill_in_form(name: "stakeholder1", field: "onderwijs") 

    expect(page).to have_text('Stakeholder successfully created!')
    expect(page).to have_text('stakeholder1')

  end

  it "shows the new stakeholder details" do
    fill_in_form(name: "stakeholder1", field: "media", link: "http://www.somelink.be")

    click_link 'stakeholder1'

    expect(page).to have_text('stakeholder1')
    expect(page).to have_text('media')
    expect(page).to have_link('http://www.somelink.be')

  end

  it "does not save the stakeholder if it's invalid" do
    expect{
      click_button 'Create Stakeholder'
    }.not_to change(Stakeholder, :count)

    expect(page).to have_text('error')
  end

  def fill_in_form(input = {})
    fill_in "Name", with: input[:name] 
    select input[:field], from: "Field"
    fill_in "Link", with: input[:link] 
    click_button 'Create Stakeholder'
  end
end

