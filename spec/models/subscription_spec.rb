require 'rails_helper'

RSpec.describe User do
  it "accepts properly formatted email addresses" do
    emails = %w[user@example.com first.last@example.com]
    emails.each do |email|
      subscription = Subscription.new(email: email)
      subscription.valid?
      expect(subscription.errors[:email].any?).to eq(false)
    end
  end

  it "rejects improperly formatted email addresses" do
    emails = %w[@ user@ @example.com]
    emails.each do |email|
      subscription = Subscription.new(email: email)
      subscription.valid?
      expect(subscription.errors[:email].any?).to eq(true)
    end
  end

  it "requires a unique, case insensitive email address" do
    subscription1 = Subscription.create!(email: "test@example.com")

    subscription2 = Subscription.new(email: subscription1.email.upcase)
    subscription2.valid?
    expect(subscription2.errors[:email].first).to eq("has already been taken")
  end
end
