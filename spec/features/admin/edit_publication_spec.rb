require 'rails_helper'

describe "Editing a publication" do

  let(:user) { User.create!(user_attributes) }
  let!(:publication) { Publication.create!(publication_attributes) }
  let!(:category1) { Category.create!(name: "presentaties") }
  let!(:category2) { Category.create!(name: "rapporten") }

  before do
    sign_in(user)
    visit admin_publications_path
    click_link 'Edit'
  end

  it "updates the publication and shows the updated details" do
    fill_in_form(title: "new title", category: "presentaties")
    expect(page).to have_text('new title')
    expect(page).to have_text('Publication successfully updated!')
  end

  it "shows the updated publication details" do
    fill_in_form(title: "new title", category: "presentaties")

    publication.reload

    click_link publication.title
    expect(page).to have_text 'new title'
    expect(page).to have_text 'presentaties'
  end

  it "shows the changed category" do
    fill_in_form(title: "new title", category: "rapporten")

    publication.reload

    click_link publication.title
    expect(page).to have_text 'rapporten'
  end

  it "does not update the publication if it's invalid" do
    fill_in_form(title: " ", category: "presentaties")
    expect(page).to have_text('error')
  end

  def fill_in_form(fields = {})
    fill_in 'Title', with: fields[:title]
    select fields[:category], from: "Category"
    click_button 'Update Publication'
  end
end

