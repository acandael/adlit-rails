class MembersController < ApplicationController
  def index
    @members = Member.by_organization
  end

  def show
    @member = Member.find(params[:id])
  end
end

