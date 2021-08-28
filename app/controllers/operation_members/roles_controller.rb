class OperationMembers::RolesController < ApplicationController
  before_action :set_group

  def update
    if @group.members.length < 2
      redirect_to group_path(@group), notice: "メンバーを追加してください"
      return
    end
    current_organizer = @group.group_members&.find_by(group_id: @group.id, role: 1)
    target_member = @group.group_members&.where(group_id: @group.id, role: 0).sample
    if current_organizer.nil?
      target_member.organizer!
    else
      current_organizer.regular!
      target_member.organizer!
    end
    redirect_to group_path(@group), notice: '幹事を設定しました'
  end

  private

  def set_group
    @group = Group.find(params[:id])
  end
end
