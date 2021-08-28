class OperationMembers::RolesController < ApplicationController
  before_action :set_group

  def update
    current_organizer = @group.group_members&.find_by(group_id: @group.id, role: 1)
    if current_organizer.nil?
      target_member = @group.group_members&.where(group_id: @group.id, role: 0).sample
      target_member.update(role: 1)
    else
      target_member = @group.group_members&.where(group_id: @group.id, role: 0).sample
      current_organizer.update(role: 0)
      target_member.update(role: 1)
    end
    redirect_to group_path(@group), notice: '幹事を設定しました'
  end

  private

  def set_group
    @group = Group.find(params[:id])
  end
end
