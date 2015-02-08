class NewsArticle < ActiveRecord::Base
  validates :title, :body, presence: true
  validates :link, :format => URI::regexp(%w(http https)), allow_blank: true
  attachment :image
  attachment :document
end

