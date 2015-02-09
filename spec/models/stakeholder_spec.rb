require 'rails_helper'

describe Stakeholder do
  it { should validate_presence_of(:name) }
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
end

