require 'rails_helper'

describe "Creating a new stakeholder" do
  before do
    user = User.create!(user_attributes)
    sign_in(user)
  end

  it "saves the stakeholder and shows the new stakeholder details" do
    Field.create!(name: "onderwijs")

    visit admin_stakeholders_path

    click_button 'Add New Stakeholder'

    expect(current_path).to eq(new_admin_stakeholder_path)

    fill_in "Name", with: "FOD Financien"
    select "onderwijs", from: "Field"
    fill_in "Link", with: "http://www.fodfinancien.be"

    click_button 'Create Stakeholder'
    
    expect(current_path).to eq(admin_stakeholders_path)
    expect(page).to have_text('Stakeholder successfully created!')
    expect(page).to have_text('FOD Financien')

    click_link 'FOD Financien'

    expect(page).to have_text('FOD Financien')
    expect(page).to have_text('onderwijs')
    expect(page).to have_link('http://www.fodfinancien.be')
  end

  it "does not save the stakeholder if it's invalid" do
    Field.create!(name: "onderwijs")

    visit admin_stakeholders_path

    click_button 'Add New Stakeholder'

    expect{
      click_button 'Create Stakeholder'
    }.not_to change(Stakeholder, :count)

    expect(page).to have_text('error')
  end
end

