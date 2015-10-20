require 'rails_helper'

describe "viewing the list of publications" do
  
  let(:user) { User.create!(user_attributes) } 
  let(:category1) { Category.create!(name: "presentaties") }
  let(:category2) { Category.create!(name: "rapporten") }
  let(:category3) { Category.create!(name: "wetenschappelijke output") }
  let!(:publication1) { Publication.create!(title: "title 1", year: 2015, category_id: category1.id) }
  let!(:publication2) { Publication.create!(title: "title 2", year: 2015, category_id: category2.id) }
  let!(:publication3) { Publication.create!(title: "title 3", year: 2015, category_id: category3.id) }

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

