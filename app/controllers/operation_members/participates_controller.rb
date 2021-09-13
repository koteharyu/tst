class OperationMembers::ParticipatesController < ApplicationController
  before_action :set_group, only: [:destroy]

  def create
    @group = Group.find(params[:group_id])
    member = Member.find(params[:member_id])
    @group.participate(member)
    redirect_to group_path(@group), notice: 'メンバーが増えました'
  end

  def destroy
    # member = GroupMember.find_by(group_id: @group.id, member_id: params[:member_id]).member
    member = @group.members.find(params[:member_id])
    @group.withdraw(member)
    redirect_to group_path(@group), notice: 'メンバーが減りました'
  end

  private

  def set_group
    @group = Group.find(params[:id])
  end

  def participate_params
    params[:member_id].to_i
  end
end
