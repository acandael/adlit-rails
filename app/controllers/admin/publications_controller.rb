class Admin::PublicationsController < DashboardController
  before_action :set_publication, only: [:show, :edit, :update, :destroy]

  def index
    if (category_selected?)
      @publications = Publication.filter_by_category(params[:publication][:category])
      @selected = params[:publication].try(:[], :category)
    else
      @publications = Publication.all.order("created_at asc")
    end
  end

  def show
  end

  def new
    @publication = Publication.new
  end

  def create
    @publication = Publication.new(publication_params)
    if @publication.save
      redirect_to admin_publications_path, notice: "Publication successfully created!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @publication.update(publication_params)
      redirect_to admin_publications_path, notice: "Publication successfully updated!"
    else
      render :edit
    end
  end

  def destroy
    @publication.destroy
    redirect_to admin_publications_path, notice: "Publication successfully deleted!"
  end

  private

  def publication_params
    params.require(:publication).permit(:title, :year, :category_id, :document, :remove_document)
  end

  def set_publication
    @publication = Publication.find(params[:id])
  end

  def category_selected?
    params.has_key?(:publication) && (params[:publication][:category] != "")
  end
end
