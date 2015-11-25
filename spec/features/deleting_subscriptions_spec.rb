require "rails_helper"

RSpec.feature "Deleting a subscription" do
  let(:user) { User.create!(user_attributes) }

  before do
    Subscription.create(email: "test@example.com")
    sign_in(user)
    visit admin_subscriptions_path
    click_link "Delete"
  end
  it "shows the success message" do
    expect(page).to have_content "Subscription has been deleted." 
  end
end
