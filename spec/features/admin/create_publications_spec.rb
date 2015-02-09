require 'rails_helper'

describe "Creating a new publication" do
  before do
    user = User.create!(user_attributes)
    sign_in(user)
  end

  it "saves the publication and shows the new publication details" do
    Category.create!(name: "Presentaties")

    visit admin_publications_path

    click_button 'Add New Publication'

    expect(current_path).to eq(new_admin_publication_path)


    fill_in "Title", with: "New Publication Title"
    select "Presentaties", from: "Category"
    
    click_button 'Create Publication'

    expect(current_path).to eq(admin_publications_path)
    expect(page).to have_text('Publication successfully created!')
    expect(page).to have_text('New Publication Title')

    click_link 'New Publication Title'
    expect(page).to have_text('New Publication Title')
    expect(page).to have_text('Presentaties')
  end

  it "does not save the publication if it's invalid" do
    Category.create!(name: "Presentaties")

    visit admin_publications_path
    click_button 'Add New Publication'

    expect { 
      click_button 'Create Publication'
    }.not_to change(Publication, :count)

    expect(page).to have_text('error')
  end
end

