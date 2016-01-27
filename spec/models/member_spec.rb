require 'rails_helper'

describe Member do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:organization) }
  #it { should validate_uniqueness_of(:email).case_insensitive }

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

  it "accepts a member with a blank url" do
    member = Member.new(member_attributes(link: ""))

    member.valid?

    expect(member.errors[:link].any?).to eq(false)
  end

  it "generates a slug when it's created" do
    member = Member.create!(member_attributes(name: "Daniel Biltereyst"))

    expect(member.slug).to eq("daniel-biltereyst")
  end

  it "requires a unique name" do
    member1 = Member.create!(member_attributes)

    member2 = Member.new(name: member1.name)
    member2.valid? # populates errors
    expect(member2.errors[:name].first).to eq("has already been taken")
  end

  it "requires a unique slug" do
    member1 = Member.create!(member_attributes)

    member2 = Member.new(slug: member1.slug)
    member2.valid? # populates errors
    expect(member2.errors[:slug].first).to eq("has already been taken")
  end

end

