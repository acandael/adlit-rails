require 'rails_helper'

describe Stakeholder do
  it { should validate_presence_of(:name) }
  #it { should validate_uniqueness_of(:name) }
  it { should validate_presence_of(:field_id) }

  it "accepts properly formatted links" do
    links = %w[http://www.somewebsite.com http://somewebsite.com]

    links.each do |link|
      stakeholder = Stakeholder.new(stakeholder_attributes(link: link))
      stakeholder.valid?

      expect(stakeholder.errors[:link].any?).to eq(false)
    end
  end

  it "rejects improperly formated links" do
      links = %w[www.somewebsite.com somewebsite.com]

      links.each do |link|
        stakeholder = Stakeholder.new(stakeholder_attributes(link: link))
        stakeholder.valid?

        expect(stakeholder.errors[:link].any?).to eq(true)
      end
  end

  it "accepts a stakeholder with blank link" do
    stakeholder = Stakeholder.new(stakeholder_attributes(link: ""))

    stakeholder.valid?

    expect(stakeholder.errors[:link].any?).to eq(false)
  end

  it "filters by field" do
    field1 = Field.create!(name: "onderwijs")
    field2 = Field.create!(name: "media")
    stakeholder1 = Stakeholder.create!(stakeholder_attributes(name: "stakeholder1", field_id: field1.id))
    stakeholder2 = Stakeholder.create!(stakeholder_attributes(name: "stakeholder2", field_id: field2.id))
    stakeholder3 = Stakeholder.create!(stakeholder_attributes(name: "stakeholder3", field_id: field1.id))

    stakeholders = Stakeholder.filter(field1.id)

    expect(stakeholders).not_to include(stakeholder2)
  end
end

