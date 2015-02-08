require 'rails_helper'

describe "Editing a publication" do
  it "updates the publication and shows the updated details" do
    category = Category.create!(name: "presentaties")
    publication = Publication.create!(title: "Publication Title",
                                      category: category)

    visit admin_publications_path

    click_link 'Edit'

    expect(current_path).to eq(edit_admin_publication_path(publication))
    expect(find_field('Title').value).to eq(publication.title)

    fill_in 'Title', with: "Updated Publication Title"

    click_button 'Update Publication'

    expect(current_path).to eq(admin_publications_path)

    publication.reload

    expect(page).to have_text('Updated Publication Title')
    expect(page).to have_text('Publication successfully updated!')
  end

  it "does not update the publication if it's invalid" do
    category = Category.create!(name: "presentaties")
    publication = Publication.create!(title: "Publication Title",
                                      category: category)


    visit edit_admin_publication_path(publication)

    fill_in 'Title', with: " "

    click_button 'Update Publication'

    expect(page).to have_text('error')
  end
end

