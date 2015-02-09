class Admin::PublicationsController < DashboardController
  def index
    @publications = Publication.all
  end

  def show
    @publication = Publication.find(params[:id])
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
    @publication = Publication.find(params[:id])
  end

  def update
    @publication = Publication.find(params[:id])
    if @publication.update(publication_params)
      redirect_to admin_publications_path, notice: "Publication successfully updated!"
    else
      render :edit
    end
  end

  def destroy
    @publication = Publication.find(params[:id])
    @publication.destroy
    redirect_to admin_publications_path, notice: "Publication successfully deleted!"
  end

  private

  def publication_params
    params.require(:publication).permit(:title, :category_id, :document, :remove_document)
  end
end

