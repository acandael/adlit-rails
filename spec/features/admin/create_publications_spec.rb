require 'rails_helper'

describe "Creating a new publication" do

  let(:user) { User.create!(user_attributes) }
  let!(:category) { Category.create!(name: "presentaties") }

  before do
    sign_in(user)
    visit admin_publications_path
    click_button 'Add New Publication'
  end

  it "saves the publication and shows the new publication details" do
    fill_in_form(title: "new title", category: "presentaties")

    expect(current_path).to eq(admin_publications_path)
    expect(page).to have_text('Publication successfully created!')
    expect(page).to have_text('new title')
  end

  it "shows the updated publication details" do
    fill_in_form(title: "new title", category: "presentaties")

    click_link 'new title'
    expect(page).to have_text('new title')
    expect(page).to have_text('presentaties')
  end

  it "does not save the publication if it's invalid" do
    expect { 
      click_button 'Create Publication'
    }.not_to change(Publication, :count)

    expect(page).to have_text('error')
  end

  def fill_in_form(fields = {})
    fill_in "Title", with: fields[:title] 
    select fields[:category], from: "Category"
    
    click_button 'Create Publication'
  end
end

