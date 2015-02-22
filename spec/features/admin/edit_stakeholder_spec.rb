require 'rails_helper'

describe "Editing a stakeholder" do
  
    let!(:field1) { Field.create!(name: "onderwijs") }
    let!(:field2) { Field.create!(name: "media") }
    let!(:stakeholder) { Stakeholder.create!(stakeholder_attributes(field_id: field1.id)) }

  before do
    user = User.create!(user_attributes)
    sign_in(user)
    visit admin_stakeholders_path
    click_link 'Edit'
  end

  it "updates the stakeholder and shows the updated details" do
    fill_in_form(name: "new stakeholder", field: "onderwijs")
    expect(page).to have_text('new stakeholder')
    expect(page).to have_text('Stakeholder successfully updated!')
  end

  it "shows the updated stakeholder details" do
    fill_in_form(name: "new stakeholder", field: "onderwijs")

    stakeholder.reload

    click_link stakeholder.name

    expect(page).to have_text "new stakeholder"
  end

  it "updates the stakeholder's field" do
    fill_in_form(name: "new stakeholder", field: "media")

    stakeholder.reload

    click_link stakeholder.name

    expect(page).to have_text "media"
  end

  it "does not update the stakeholder if it's invalid" do
    fill_in_form(name: " ", field: "onderwijs")

    expect(page).to have_text('error')
  end

  def fill_in_form(input = {})
    fill_in 'Name', with: input[:name] 
    select input[:field], from: "Field"
    click_button 'Update Stakeholder'
  end
end

