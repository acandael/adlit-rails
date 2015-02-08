require 'rails_helper'

describe 'viewing an individual news article' do
  it 'shows the news article details' do
    newsarticle = NewsArticle.create!(newsarticle_attributes)

    visit news_path

    click_link "Lees Meer" 

    expect(current_path).to eq(news_article_path(newsarticle))
    expect(page).to have_text(newsarticle.title)
    expect(page).to have_text(newsarticle.created_at.strftime('%d %B %Y'))
    expect(page).to have_selector("img[src$='#{newsarticle.image}']")
    expect(page).to have_text(newsarticle.body)
    expect(page).to have_link(newsarticle.link)
  end
end

