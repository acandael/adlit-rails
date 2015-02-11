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

  it "includes the article's title in the page title" do
    newsarticle = NewsArticle.create!(newsarticle_attributes)

    visit news_article_path(newsarticle) 

    expect(page).to have_title("AdLit - #{newsarticle.title}")
  end

  it "generates a slug when it's created" do
    news_article = NewsArticle.create!(newsarticle_attributes(title: "The Internet Trap"))
    
    expect(news_article.slug).to eq("the-internet-trap")
  end

  it "requires a unique title" do
    article1 = NewsArticle.create!(newsarticle_attributes)
    article2 = NewsArticle.new(title: article1.title)

    article2.valid?
    expect(article2.errors[:title].first).to eq("has already been taken")
  end

  it "requires a unique slug" do
    article1 = NewsArticle.create!(newsarticle_attributes)

    article2 = NewsArticle.new(slug: article1.slug)
    article2.valid? # populates errors
    expect(article2.errors[:slug].first).to eq("has already been taken")
  end
  
end

