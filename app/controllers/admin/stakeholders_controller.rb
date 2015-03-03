class Admin::StakeholdersController < DashboardController
  before_action :set_stakeholder, only: [:show, :edit, :update, :destroy]

  def index
    if (field_selected?)
      @stakeholders = Stakeholder.filter_by_field(params[:stakeholder][:field])
      @selected = params[:stakeholder].try(:[], :field)
    else
      @stakeholders = Stakeholder.all
    end
  end

  def show
  end

  def new
    @stakeholder = Stakeholder.new
  end

  def create
    @stakeholder = Stakeholder.new(stakeholder_params)
    if @stakeholder.save
      redirect_to admin_stakeholders_path, notice: "Stakeholder successfully created!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @stakeholder.update(stakeholder_params)
      redirect_to admin_stakeholders_path, notice: "Stakeholder successfully updated!"
    else
      render :edit
    end
  end

  def destroy
    @stakeholder.destroy
    redirect_to admin_stakeholders_path, notice: "Stakeholder successfully deleted!"
  end

  private

  def field_selected?
    params.has_key?(:stakeholder) && (params[:stakeholder][:field] != "")
  end
  

  def stakeholder_params
    params.require(:stakeholder).permit(:name, :field_id, :link)
  end

  def set_stakeholder
    @stakeholder = Stakeholder.find(params[:id])
  end
end
