require 'rails_helper'

describe 'Deleting a stakeholder' do

  let(:user) { User.create!(user_attributes) } 
  let!(:field) { Field.create!(name: "onderwijs") }
  let!(:stakeholder) { Stakeholder.create!(stakeholder_attributes(field_id: field.id)) }
  before do
    sign_in(user)
    visit admin_stakeholders_path
    click_link 'Delete'
  end

  it "destroys the stakeholder and show the stakeholder listing without the deleted stakeholder" do
    expect(page).not_to have_text(stakeholder.name)
    expect(page).to have_text('Stakeholder successfully deleted!')
  end
end

