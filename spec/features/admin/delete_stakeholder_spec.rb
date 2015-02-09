require 'rails_helper'

describe 'Deleting a stakeholder' do
  it "destroys the stakeholder and show the stakeholder listing without the deleted stakeholder" do
    field = Field.create!(name: "onderwijs")
    stakeholder = Stakeholder.create!(stakeholder_attributes(field_id: field.id))

    visit admin_stakeholders_path

    click_link 'Delete'

    expect(current_path).to eq(admin_stakeholders_path)
    expect(page).not_to have_text(stakeholder.name)
    expect(page).to have_text('Stakeholder successfully deleted!')
  end
end

