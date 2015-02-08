module ApplicationHelper
  def options_for_categories
    Category.all.map { |category| [category.name, category.id] }
  end
end
