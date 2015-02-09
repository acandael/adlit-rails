class StakeholdersController < ApplicationController
  def index
    @stakeholders = Stakeholder.all
  end
end

