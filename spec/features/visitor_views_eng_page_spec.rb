require 'rails_helper'

describe 'viewing the english page' do
  it 'shows the english page content' do
    visit english_path

    expect(page).to have_text('What is AdLit?')
  end
end
