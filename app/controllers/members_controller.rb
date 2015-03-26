class MembersController < ApplicationController
  def index
    @members = Member.order_by_position
  end

  def show
    @member = Member.find_by!(slug: params[:id])
  end
end
