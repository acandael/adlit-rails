class Admin::StakeholdersController < ApplicationController
  def index
    @stakeholders = Stakeholder.all
  end

  def show
    @stakeholder = Stakeholder.find(params[:id])
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
    @stakeholder = Stakeholder.find(params[:id])
  end

  def update
    @stakeholder = Stakeholder.find(params[:id])
    if @stakeholder.update(stakeholder_params)
      redirect_to admin_stakeholders_path, notice: "Stakeholder successfully updated!"
    else
      render :edit
    end
  end

  def destroy
    @stakeholder = Stakeholder.find(params[:id])
    @stakeholder.destroy
    redirect_to admin_stakeholders_path, notice: "Stakeholder successfully deleted!"
  end

  private

  def stakeholder_params
    params.require(:stakeholder).permit(:name, :field_id, :link)
  end
end

