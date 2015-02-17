require 'rails_helper'

describe 'viewing the homepage' do
  it 'shows no more then 6 news articles' do
    article1 = NewsArticle.create!(newsarticle_attributes(title: "article1"))
    article2 = NewsArticle.create!(newsarticle_attributes(title: "article2"))
    article3 = NewsArticle.create!(newsarticle_attributes(title: "article3"))
    article4 = NewsArticle.create!(newsarticle_attributes(title: "article4"))
    article5 = NewsArticle.create!(newsarticle_attributes(title: "article5"))
    article6 = NewsArticle.create!(newsarticle_attributes(title: "article6"))
    article7 = NewsArticle.create!(newsarticle_attributes(title: "article7"))

    visit root_path

    expect(page).to have_text(article1.title)
    expect(page).to have_text(article2.title)
    expect(page).to have_text(article3.title)
    expect(page).to have_text(article4.title)
    expect(page).to have_text(article5.title)
    expect(page).to have_text(article6.title)
    expect(page).not_to have_text(article7.title)
  end

  it 'shows the news article when the link is clicked' do
    article = NewsArticle.create!(newsarticle_attributes(title: "article1"))

    visit root_path

    click_link article.title

    expect(current_path).to eq(news_article_path(article))
  end
end
