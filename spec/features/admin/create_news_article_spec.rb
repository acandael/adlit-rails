require 'rails_helper'

describe "Creating a newsarticle" do
  
  let!(:newscategory1) { NewsCategory.create!(name: "aanbevolen") }
  let!(:newscategory2) { NewsCategory.create!(name: "project") }

  before do
    user = User.create!(user_attributes)
    sign_in(user)
    visit admin_news_articles_path
    click_button 'Add News Article'
  end

  it "saves the newsarticle and shows the newsarticle details" do
    fill_in_form(title: "new title", category: newscategory1.name,  body: "this is the body")
    expect(current_path).to eq(admin_news_articles_path)
    expect(page).to have_text('The news article was successfully added')
    expect(page).to have_text('new title')
  end

  it "shows the new newsarticle details" do
    fill_in_form(title: "new title", category: newscategory1.name,  body: "some description", link: "http://www.somelink.be")

    newsarticle = NewsArticle.last
    
    click_link newsarticle.title

    expect(page).to have_text('new title')
    expect(page).to have_text('some description')
    expect(page).to have_text('http://www.somelink.be')
  end

  it "doesn't save the news article when the data is invalid" do
    fill_in_form(title: " ", category: newscategory1.name)
    expect(page).to have_text('Oops! The newsarticle could not be saved.')
  end

  def fill_in_form(fields = {})
    fill_in "Title", with: fields[:title] 
    select fields[:category], from: "Category"
    fill_in "Body", with: fields[:body] 
    fill_in "Link", with: fields[:link] 

    click_button 'Create News article'
  end
end

