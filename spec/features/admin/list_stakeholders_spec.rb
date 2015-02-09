require 'rails_helper'

describe "viewing the list of stakeholders" do

  before do
    user = User.create!(user_attributes)
    sign_in(user)
  end

  it "shows the stakeholders" do
    field1 = Field.create!(name: "beleidsmakers")
    field2 = Field.create!(name: "maatschappelijke actoren")
    field3 = Field.create!(name: "onderwijs")

    stakeholder1 = Stakeholder.create!(name: "Departement Cultuur, Media, Jeugd en Sport",
                                       field_id: field1.id,
                                       link: "http://www.somelink.be")

    stakeholder2 = Stakeholder.create!(name: "FOD Economie",
                                       field_id: field2.id,
                                       link: "http://www.anotherlink.be")

    stakeholder3 = Stakeholder.create!(name: "Commissie voor de bescherming van de persoonlijke levenssfeer",
                                       field_id: field3.id,
                                       link: "http://www.anotherwebsite.be")

    visit admin_stakeholders_path

    expect(page).to have_text(stakeholder1.name)
    expect(page).to have_text(stakeholder2.name)
    expect(page).to have_text(stakeholder3.name)
  end
end

