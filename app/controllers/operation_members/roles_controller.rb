class OperationMembers::RolesController < ApplicationController
  before_action :set_group

  def update
    if @group.members.length < 2
      redirect_to group_path(@group), notice: "メンバーを追加してください"
      return
    end
    current_organizer = @group.set_current_organizer
    target_member = @group.set_target_member
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
