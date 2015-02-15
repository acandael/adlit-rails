class Admin::StakeholdersController < DashboardController
  before_action :set_stakeholder, only: [:show, :edit, :update, :destroy]

  def index
    @stakeholders = Stakeholder.all
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

  def stakeholder_params
    params.require(:stakeholder).permit(:name, :field_id, :link)
  end

  def set_stakeholder
    @stakeholder = Stakeholder.find(params[:id])
  end
end
