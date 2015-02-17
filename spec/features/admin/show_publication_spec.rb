require 'rails_helper'

describe 'admin views an individual publication' do
  before do
    user = User.create!(user_attributes)
    sign_in(user)
  end

  it 'shows the publication details' do
    category = Category.create!(name: "reports")
    publication = Publication.create!(publication_attributes(category_id: category.id))

    visit admin_publications_path

    click_link publication.title

    expect(current_path).to eq(admin_publication_path(publication))
    expect(page).to have_text(publication.title)
    expect(page).to have_text(publication.category.name)
  end
end
