class Admin::MembersController < DashboardController
  def index
    @members = Member.by_organization
  end

  def show
    @member = Member.find(params[:id])
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
    @member = Member.find(params[:id])    
  end

  def update
    @member = Member.find(params[:id])
    if @member.update(member_params)
      redirect_to admin_members_path, notice: "Member successfully updated"
    else
      render :edit
    end
  end

  def destroy
    @member = Member.find(params[:id])
    @member.destroy
    redirect_to admin_members_path, notice: "Member successfully deleted!"
  end

  private

  def member_params
    params.require(:member).permit(:name, :function, :image, :remove_image, :email, :phone, :organization, :address, :affiliation, :link)
  end
end

