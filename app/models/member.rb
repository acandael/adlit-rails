class Member < ActiveRecord::Base
  validates :name, :organization, presence: true
  validates :email, presence: true,
                    format: /\A\S+@\S+\z/,
                    uniqueness: { case_sensitive: false }

  
  validates :link, :format => URI::regexp(%w(http https)), allow_blank: true
  attachment :image

  scope :by_organization, ->{ order(organization: :asc) }
end

