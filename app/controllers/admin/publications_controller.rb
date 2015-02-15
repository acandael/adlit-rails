class Admin::PublicationsController < DashboardController
  before_action :set_publication, only: [:show, :edit, :update, :destroy]

  def index
    @publications = Publication.all
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
    params.require(:publication).permit(:title, :category_id, :document, :remove_document)
  end

  def set_publication
    @publication = Publication.find(params[:id])
  end
end
