require 'rails_helper'

describe "viewing the list of stakeholders" do

    let!(:field1) { Field.create!(name: "beleidsmakers") }
    let!(:field2) { Field.create!(name: "onderwijs") }

    let!(:stakeholder1) { Stakeholder.create!(name: "stakeholder1", field_id: field1.id) }
    let!(:stakeholder2) { Stakeholder.create!(name: "stakeholder2", field_id: field2.id) }
    let!(:stakeholder3) { Stakeholder.create!(name: "stakeholder3", field_id: field1.id) }
  before do
    user = User.create!(user_attributes)
    sign_in(user)
    visit admin_stakeholders_path
  end

  it "shows the stakeholders" do
    expect(page).to have_text(stakeholder1.name)
    expect(page).to have_text(stakeholder2.name)
    expect(page).to have_text(stakeholder3.name)
  end

end

