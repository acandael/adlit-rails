class Stakeholder < ActiveRecord::Base
  belongs_to :field
  validates :name, :field_id, presence: true
  validates :link, format: URI::regexp(%w(http https)), allow_blank: true
end
