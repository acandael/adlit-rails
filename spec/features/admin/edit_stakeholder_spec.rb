require 'rails_helper'

describe "Editing a stakeholder" do
  it "updates the stakeholder and shows the updated details" do
    field = Field.create!(name: "onderwijs")
    stakeholder = Stakeholder.create!(stakeholder_attributes(field_id: field.id))

    visit admin_stakeholders_path

    click_link 'Edit'

    expect(current_path).to eq(edit_admin_stakeholder_path(stakeholder))
    expect(find_field('Name').value).to eq(stakeholder.name)

    fill_in 'Name', with: "Updated Stakeholder Title"

    click_button 'Update Stakeholder'

    expect(current_path).to eq(admin_stakeholders_path)

    stakeholder.reload

    expect(page).to have_text('Updated Stakeholder Title')
    expect(page).to have_text('Stakeholder successfully updated!')
  end

  it "does not update the stakeholder if it's invalid" do
    field = Field.create!(name: "onderwijs")
    stakeholder = Stakeholder.create!(stakeholder_attributes(field_id: field.id))

    visit edit_admin_stakeholder_path(stakeholder)

    fill_in 'Name', with: " "

    click_button 'Update Stakeholder'

    expect(page).to have_text('error')
  end
end

