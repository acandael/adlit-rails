require 'rails_helper'

describe 'viewing the subscription page' do
  it 'shows the subscription form' do
    visit subscribe_path
    expect(page).to have_css "input#subscription_email"
  end
end
