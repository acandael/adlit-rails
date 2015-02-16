class Publication < ActiveRecord::Base
  belongs_to :category

  validates :title, presence: true

  attachment :document
end
