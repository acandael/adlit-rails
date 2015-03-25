require 'rails_helper'

describe 'admin views an individual news article' do
  let!(:newscategory) { NewsCategory.create!(name: "aanbevolen") }

  before do
    user = User.create!(user_attributes)
    sign_in(user)
  end
  
  it 'shows the news article details' do
    news_article = NewsArticle.create!(newsarticle_attributes)
    news_article.news_category = newscategory
    news_article.save

    visit admin_news_articles_path

    click_link news_article.title

    expect(current_path).to eq(admin_news_article_path(news_article))
    expect(page).to have_text(news_article.title)
    expect(page).to have_text("aanbevolen")
    expect(page).to have_text(news_article.body)
    expect(page).to have_selector("img[src$='#{news_article.image}']")
    expect(page).to have_link(news_article.document)
    expect(page).to have_link(news_article.link)
  end
end
