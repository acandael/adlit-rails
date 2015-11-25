require "rails_helper"

RSpec.feature "Viewing the newsletter subscriptions" do
  let(:user) { User.create!(user_attributes) }

  before do
    Subscription.create(email: "test1@example.com")
    Subscription.create(email: "test2@example.com")

    sign_in(user)
    visit admin_subscriptions_path
  end
  it "shows the email address" do
    expect(page).to have_link "test1@example.com"
    expect(page).to have_link "test2@example.com"
  end

  it "shows the subscriptions count" do
    expect(page).to have_content "number of subscriptions: 2"
  end
end
