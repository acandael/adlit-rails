require 'rails_helper'

describe Member do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:organization) }
  it { should validate_uniqueness_of(:email).case_insensitive }

  it "accepts properly formatted email addresses" do
    emails = %w[user@example.com first.last@example.com]
    emails.each do |email|
      member = Member.new(email: email)
      member.valid?
      expect(member.errors[:email].any?).to eq(false)
    end
  end

  it "rejects improperly formatted email addresses" do
    emails = %w[@ user@ @example.com]
    emails.each do |email|
      member = Member.new(email: email)
      member.valid?
      expect(member.errors[:email].any?).to eq(true)
    end
  end

  it "accepts properly formatted links" do
    links = %w[http://www.somewebsite.com http://somewebsite.com]

    links.each do |link|
      member = Member.new(link: link)

      member.valid?

      expect(member.errors[:link].any?).to eq(false)
    end
  end

  it "rejects improperly formated links" do
    links = %w[www.somewebsite.com somewebsite.com]

    links.each do |link|
      member = Member.new(link: link)

      member.valid?

      expect(member.errors[:link].any?).to eq(true)
    end
  end
end

