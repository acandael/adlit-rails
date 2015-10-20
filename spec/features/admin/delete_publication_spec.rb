require 'rails_helper'

describe "Deleting a publication" do

  let(:user) { User.create!(user_attributes) }

   let!(:category) { Category.create!(name: "presentaties") }
   let!(:publication) { Publication.create!(title: "Publication Title", year: 2015, category: category) }

  before do
    sign_in(user)
    visit admin_publications_path
    click_link 'Delete'
  end

  it "destroys the publication and shows the publication listing without the deleted publication" do
    expect(current_path).to eq(admin_publications_path)
    expect(page).not_to have_text(publication.title)
    expect(page).to have_text("Publication successfully deleted!")
  end
end

