class Publication < ActiveRecord::Base
  belongs_to :category

  scope :sort_by_category, ->(category_id){ all.where(category_id: category_id).order('created_at desc') }
  scope :filter_by_category, ->(category){ filter(category).order(:title) }
  scope :grouped_by_year, ->{ order(year: :desc).group_by { |p| p.year} }

  validates :title, presence: true
  validates :year, numericality: true

  attachment :document

  private

  def self.filter(filter)
    if filter
      where(category_id: filter)
    end
  end
end
