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
end
