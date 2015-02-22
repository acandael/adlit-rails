require 'rails_helper'

describe 'viewing the homepage' do

    let!(:article1) { NewsArticle.create!(newsarticle_attributes(title: "article1")) }
    let!(:article2) { NewsArticle.create!(newsarticle_attributes(title: "article2")) }
    let!(:article3) { NewsArticle.create!(newsarticle_attributes(title: "article3")) }
    let!(:article4) { NewsArticle.create!(newsarticle_attributes(title: "article4")) }
    let!(:article5) { NewsArticle.create!(newsarticle_attributes(title: "article5")) }
    let!(:article6) { NewsArticle.create!(newsarticle_attributes(title: "article6")) }
    let!(:article7) { NewsArticle.create!(newsarticle_attributes(title: "article7")) }

    before do
    visit root_path
    end

  it 'shows no more then 6 news articles' do
    expect(page).to have_text(article1.title)
    expect(page).to have_text(article2.title)
    expect(page).to have_text(article3.title)
    expect(page).to have_text(article4.title)
    expect(page).to have_text(article5.title)
    expect(page).to have_text(article6.title)
    expect(page).not_to have_text(article7.title)
  end

  it 'shows the news article when the link is clicked' do
    click_link article1.title

    expect(current_path).to eq(news_article_path(article1))
    expect(page).to have_text(article1.title)
  end
end
