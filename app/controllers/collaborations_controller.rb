class CollaborationsController < ApplicationController
  def create
    new_collab = Collaboration.create(collaboration_params)
    redirect_to project_path(params[:collaboration][:project_id])
  end

  private

  def collaboration_params
    params.require(:collaboration).permit(:user_id, :project_id, :status)
  end
end