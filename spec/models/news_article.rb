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

  context "recent query" do
    it "returns only the six most recent news articles" do
      article1 = NewsArticle.create!(newsarticle_attributes)
      article2 = NewsArticle.create!(newsarticle_attributes)
      article3 = NewsArticle.create!(newsarticle_attributes)
      article4 = NewsArticle.create!(newsarticle_attributes)
      article5 = NewsArticle.create!(newsarticle_attributes)
      article6 = NewsArticle.create!(newsarticle_attributes)
      article7 = NewsArticle.create!(newsarticle_attributes)

      expect(NewsArticle.recent(6)).not_to include(article7)
    end
  end
  
end
