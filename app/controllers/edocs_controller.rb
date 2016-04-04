class EdocsController < ApplicationController

  def index
    @group = Group.find_by_id params[:group_id]
  end

end
