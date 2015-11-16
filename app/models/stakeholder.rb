class Stakeholder < ActiveRecord::Base
  belongs_to :field
  validates :name, :field_id, presence: true
  validates :name, uniqueness: true
  validates :link, format: URI::regexp(%w(http https)), allow_blank: true

  scope :filter_by_field, ->(field){ filter(field).order(:name) }
  scope :order_by_name, ->{ all.order(name: :asc)}

  private

  def self.filter(filter)
    if filter
      where(field_id: filter)
    end
  end
  
end
