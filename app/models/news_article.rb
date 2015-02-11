class NewsArticle < ActiveRecord::Base
  validates :title, :body, presence: true
  validates :link, :format => URI::regexp(%w(http https)), allow_blank: true
  attachment :image
  attachment :document

  scope :recent, ->(max) { order(created_at: :asc).limit(max) }
end

