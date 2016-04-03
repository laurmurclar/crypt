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

  def new_member
    @group = Group.find_by_id params[:id]
  end

  def create_member
    @group = Group.find_by_id(params[:id])
    owner = @group.owner

    if (owner && owner.user_id == current_user.id)
      @user = User.find_by(email: params[:group][:members][:email])
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

  private
  def group_params
    params.require(:group).permit(:name)
  end

end
