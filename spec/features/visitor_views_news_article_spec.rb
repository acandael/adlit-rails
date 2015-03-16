require 'rails_helper'

describe 'viewing an individual news article' do

  let!(:newsarticle) { NewsArticle.create!(newsarticle_attributes(title: "newsarticle")) } 

  it 'shows the news article details' do
    visit news_path

    click_link newsarticle.title

    expect(current_path).to eq(news_article_path(newsarticle))
    expect(page).to have_text(newsarticle.title)
    expect(page).to have_text(newsarticle.created_at.strftime('%d %B %Y'))
    expect(page).to have_selector("img[src$='#{newsarticle.image}']")
    expect(page).to have_text(newsarticle.body)
    expect(page).to have_link(newsarticle.document)
    expect(page).to have_link(newsarticle.link)
  end

  it "includes the article's title in the page title" do
    visit news_article_path(newsarticle) 

    expect(page).to have_title("AdLit - #{newsarticle.title}")
  end
end

