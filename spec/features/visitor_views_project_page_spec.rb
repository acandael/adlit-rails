require 'rails_helper'

describe 'viewing the project page' do
  it 'shows the static project information' do
    visit project_path

    expect(page).to have_text('AdLit Project')
  end
end
