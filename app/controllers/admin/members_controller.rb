class Admin::MembersController < DashboardController
  before_action :set_member, only: [:show, :edit, :update, :destroy]

  def index
    @members = Member.by_organization
  end

  def show
  end

  def new
    @member = Member.new
  end

  def create
    @member = Member.create(member_params)
    if @member.save
      redirect_to admin_members_path, notice: "The member was successfully added"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @member.update(member_params)
      redirect_to admin_members_path, notice: "Member successfully updated"
    else
      render :edit
    end
  end

  def destroy
    @member.destroy
    redirect_to admin_members_path, notice: "Member successfully deleted!"
  end

  private

  def member_params
    params.require(:member).permit(:name, :function, :image, :image_cache_id, :remove_image, :email, :phone, :organization, :address, :affiliation, :link)
  end

  def set_member
    @member = Member.find_by!(slug: params[:id])
  end
end
