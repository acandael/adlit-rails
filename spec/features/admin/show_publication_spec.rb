require 'rails_helper'

describe 'admin views an individual publication' do

  let(:user) { User.create!(user_attributes) }
  let!(:category) { Category.create!(name: "reports") } 
  let!(:publication) { Publication.create!(publication_attributes(category_id: category.id)) }

  before do
    sign_in(user)
    visit admin_publications_path
    click_link publication.title
  end

  it 'shows the publication details' do
    expect(page).to have_text(publication.title)
    expect(page).to have_text(publication.category.name)
  end
end
