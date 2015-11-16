class StakeholdersController < ApplicationController
  def index
    @stakeholders = Stakeholder.order_by_name
  end
end
