require 'rails_helper'

describe "Editing a movie" do
  let(:user) { User.create!(user_attributes) }
  let!(:newsarticle) { NewsArticle.create!(newsarticle_attributes) } 
  before do
    sign_in(user)
    visit admin_news_articles_path
    click_link 'Edit'
  end

  it "updates the news article" do
    fill_in_form(title: "new title", body: "updated body")

    expect(page).to have_text('new title')
    expect(page).to have_text('News article successfully updated!')
  end

  it "shows the updated newsarticle details" do
    fill_in_form(title: "new title", body: "updated body")
    newsarticle.reload

    click_link newsarticle.title

    expect(page).to have_text('new title')
    expect(page).to have_text('updated body')
  end

  it "does not update the news article if it's invalid" do
    fill_in_form(title: " ", body: "updated body")
    expect(page).to have_text('error')
  end

  def fill_in_form(fields = {})
    fill_in 'Title', with: fields[:title] 
    fill_in 'Body', with: fields[:body]
    click_button 'Update News article'
  end
end

