class OperationMembers::RolesController < ApplicationController
  before_action :set_group
  before_action :less_than_2_members

  def create
    current_organizer = @group.current_organizer
    target_member = @group.target_member
    if current_organizer.nil?
      target_member.organizer!
    else
      current_organizer.regular!
      target_member.organizer!
    end
    target_member_name = @group.target_member_name(target_member)
    redirect_to group_path(@group), notice: "幹事は #{target_member_name}さん に決まりました"
  end

  private

  def set_group
    @group = Group.find(params[:group_id])
  end

  def less_than_2_members
    if @group.members.length < 2
      redirect_to group_path(@group), notice: "メンバーを追加してください"
    end
  end
end
