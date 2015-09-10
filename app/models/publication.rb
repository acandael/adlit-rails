class Publication < ActiveRecord::Base
  belongs_to :category

  scope :sort_by_category, ->(category_id){ all.where(category_id: category_id) }

  validates :title, presence: true

  attachment :document
end
