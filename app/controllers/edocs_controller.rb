class EdocsController < ApplicationController

  def index
    @group = Group.find_by_id params[:group_id]
  end

  def new
    group = Group.find_by_id params[:group_id]
    @edoc = group.edocs.new
  end

  def create
    group = Group.find_by_id params[:edoc][:group_id]
    @edoc = group.edocs.new(edoc_params)

    if @edoc.save
      flash[:success] = "File added"
      redirect_to edocs_path(group_id: group)
    else
      flash[:success] = "Invalid file"
      render :new
    end
  end

  def download
    edoc = Edoc.find(params[:id])
    send_file edoc.doc.path
  end

private

  def edoc_params
    params.require(:edoc).permit(:name, :doc)
  end

end
