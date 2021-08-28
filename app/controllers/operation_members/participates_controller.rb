class OperationMembers::ParticipatesController < ApplicationController
  before_action :set_group

  def update
    new_member_ids = @group.member_ids << participate_params
    binding.pry
    @group.update(member_ids: new_member_ids)
    redirect_to group_path(@group)
  end

  private

  def set_group
    @group = Group.find(params[:id])
  end

  def participate_params
    params[:member_id]
  end
end
