require 'rails_helper'

feature 'Admin interacts with news' do

  let(:user) { User.create!(user_attributes) } 
  let!(:newsarticle1) { NewsArticle.create!(newsarticle_attributes) }
  let!(:newsarticle2) { NewsArticle.create(title: "Ello, social netwerken zonder reclame",  body: "Er heerst heel wat buzz op het Internet.. There is a new player in social media!") }

  before do
    sign_in(user)
    visit admin_news_articles_path
  end

  scenario 'and sees news items' do
    expect(page).to have_text(newsarticle1.title)
    expect(page).to have_text(newsarticle2.title)
  end

  scenario 'admin clicks news-article link and sees details' do
    click_link newsarticle1.title

    expect(page).to have_text newsarticle1.title
    expect(page).to have_text newsarticle1.body
    expect(page).to have_text newsarticle1.link
  end

end

