module ApplicationHelper
  def options_for_categories
    Category.all.map { |category| [category.name, category.id] }
  end

  def options_for_fields
    Field.all.map { |field| [field.name, field.id] }
  end
end
