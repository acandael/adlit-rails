class NewsArticle < ActiveRecord::Base
  before_validation :generate_slug
  belongs_to :news_category

  validates :title, :body, presence: true
  validates :title, uniqueness: true
  validates :slug, uniqueness: true
  validates :link, format: URI::regexp(%w(http https)), allow_blank: true
  scope :filter_by_category, ->(category){ filter(category).order(:title) }
  attachment :image, type: :image
  attachment :document

  scope :recent, ->(max) { order(created_at: :desc).limit(max) }

  def generate_slug
    self.slug ||= title.parameterize if title
  end

  def to_param
    slug
  end

  private

  def self.filter(filter)
    if filter
      where(news_category_id: filter)
    end
  end
end
