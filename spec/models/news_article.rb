require 'rails_helper'

describe NewsArticle do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:body) }

  it "accepts properly formatted links" do
    links = %w[http://www.somewebsite.com http://somewebsite.com]

    links.each do |link|
      news_article = NewsArticle.new(link: link)

      news_article.valid?

      expect(news_article.errors[:link].any?).to eq(false)
    end
  end

  it "rejects improperly formated links" do
    links = %w[www.somewebsite.com somewebsite.com]

    links.each do |link|
      news_article = NewsArticle.new(link: link)

      news_article.valid?

      expect(news_article.errors[:link].any?).to eq(true)
    end
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

  context "recent query" do
    before do
      @article1 = NewsArticle.create!(newsarticle_attributes(title: "article1"))
      @article2 = NewsArticle.create!(newsarticle_attributes(title: "article2"))
      @article3 = NewsArticle.create!(newsarticle_attributes(title: "article3"))
      @article4 = NewsArticle.create!(newsarticle_attributes(title: "article4"))
      @article5 = NewsArticle.create!(newsarticle_attributes(title: "article5"))
      @article6 = NewsArticle.create!(newsarticle_attributes(title: "article6"))
      @article7 = NewsArticle.create!(newsarticle_attributes(title: "article7"))
      
    end
    it "returns only the six most recent news articles" do
      expect(NewsArticle.recent(6)).not_to include(@article7)
    end

  end
  
end
