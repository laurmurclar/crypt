class MembersController < ApplicationController

  def new
    @group = Group.find_by_id params[:group_id]
    @member = @group.members.new
  end

  def create
    @group = Group.find_by_id(params[:member][:group_id])
    owner = @group.owner

    if (owner && owner.user_id == current_user.id)
      @user = User.find_by(email: params[:member][:user][:email])
      @member = @group.members.new(user: @user, role: 'contributor')

      if @member.save
        flash[:success] = "Member added"
        redirect_to root_path
      else
        flash[:danger] = "Error adding member"
        render :new_member
      end
    else
      flash[:danger] = "You are not the owner of this group"
      redirect_to root_path
    end
  end

  def index
    @group = Group.find_by_id params[:group_id]
  end

private
  def member_params
    params.require(:member).permit(:email)
  end

end
