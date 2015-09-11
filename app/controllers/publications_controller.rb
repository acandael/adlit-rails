class PublicationsController < ApplicationController
  def index
    @publications = Publication.order(:category_id)
  end

  def sort
    @category = Category.find_by_name(params[:category])
    @publications = Publication.sort_by_category(@category.id)
  end

  private
end
