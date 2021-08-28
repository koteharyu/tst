class OperationMembers::ParticipatesController < ApplicationController
  before_action :set_group

  private

  def set_group
    @group = Group.find(params[:id])
  end
end
