class MembersController < ApplicationController
  def index
    @members = Member.by_organization
  end

  def show
    @member = Member.find_by!(slug: params[:id])
  end
end

