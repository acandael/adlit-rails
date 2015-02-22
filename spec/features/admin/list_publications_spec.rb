require 'rails_helper'

describe "viewing the list of publications" do
  
  let(:user) { User.create!(user_attributes) } 
  let!(:publication1) { Publication.create!(title: "title 1", category_id: 1) }
  let!(:publication2) { Publication.create!(title: "title 2", category_id: 2) }
  let!(:publication3) { Publication.create!(title: "title 3", category_id: 3) }

  before do
    sign_in(user)
    visit admin_publications_path
  end

  it "shows the publications" do
    expect(page).to have_text(publication1.title)
    expect(page).to have_text(publication2.title)
    expect(page).to have_text(publication3.title)
  end
end

