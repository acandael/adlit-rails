require 'rails_helper'

describe "Deleting a publication" do
  before do
    user = User.create!(user_attributes)
    sign_in(user)
  end

  it "destroys the publication and shows the publication listing without the deleted publication" do
    category = Category.create!(name: "presentaties")
    publication = Publication.create!(title: "Publication Title",
                                      category: category)

    visit admin_publications_path

    click_link 'Delete'

    expect(current_path).to eq(admin_publications_path)
    expect(page).not_to have_text(publication.title)
    expect(page).to have_text("Publication successfully deleted!")
  end
end

