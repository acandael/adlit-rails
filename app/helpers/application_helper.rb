module ApplicationHelper
  def options_for_categories
    Category.all.map { |category| [category.name, category.id] }
  end

  def options_for_fields
    Field.all.map { |field| [field.name, field.id] }
  end

  def page_title
    if content_for?(:title)
      "AdLit - #{content_for(:title)}"
    end
  end
end
