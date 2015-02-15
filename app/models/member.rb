class Member < ActiveRecord::Base
  before_validation :generate_slug

  validates :name, :organization, presence: true
  validates :name, uniqueness: true
  validates :slug, uniqueness: true
  validates :email, presence: true, format: /\A\S+@\S+\z/, uniqueness: { case_sensitive: false }

  validates :link, format: URI::regexp(%w(http https)), allow_blank: true
  attachment :image

  scope :by_organization, -> { order(organization: :asc) }

  def generate_slug
    self.slug ||= name.parameterize if name
  end

  def to_param
    slug
  end
end
