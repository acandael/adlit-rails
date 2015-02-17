require 'rails_helper'

describe 'admin views an individual stakeholder' do

  before do
    user = User.create!(user_attributes)
    sign_in(user)
  end

  it 'shows the stakeholder details' do
    field = Field.create!(name: "onderwijs")
    stakeholder = Stakeholder.create!(stakeholder_attributes(field_id: field.id))

    visit admin_stakeholders_path

    click_link stakeholder.name

    expect(current_path).to eq(admin_stakeholder_path(stakeholder))
    expect(page).to have_text(stakeholder.name)
    expect(page).to have_text(stakeholder.field.name)
    expect(page).to have_link(stakeholder.link)
  end
end
