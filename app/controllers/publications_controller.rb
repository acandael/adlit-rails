class PublicationsController < ApplicationController
  def index
    @publications = Publication.order(:category_id).order('created_at desc')
  end

  def sort
    @category = Category.find_by_name(params[:category])
    @publications = Publication.sort_by_category(@category.id)
  end

  private
end
