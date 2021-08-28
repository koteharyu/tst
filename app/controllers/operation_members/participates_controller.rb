class OperationMembers::ParticipatesController < ApplicationController
  before_action :set_group

  def update
    new_member_ids = @group.member_ids << participate_params
    @group.update(member_ids: new_member_ids)
    redirect_to group_path(@group)
  end

  def destroy
    @group.group_members.find_by(group_id: @group.id, member_id: participate_params.to_i).destroy
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
