class GroupsController < ApplicationController

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)

    if @group.save
      @group.members.create(user: current_user, role: 'owner')
      redirect_to root_path
    else
      flash[:danger] = "Invalid name"
      render :new
    end
  end

  private
  def group_params
    params.require(:group).permit(:name)
  end

end
