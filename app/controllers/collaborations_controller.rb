class CollaborationsController < ApplicationController
  
  def index
    @collaborations = {}
    @current_user.projects.each do |project|
      project.collaborations.each do |collab|
        @collaborations[collab.id] = {
          user: User.find(collab.user_id).name,
          project: project.title,
          status: collab.status}
      end
    end
  end


  def create
    new_collab = Collaboration.create(collaboration_params)
    redirect_to project_path(params[:collaboration][:project_id])
  end

  def update
    collab = Collaboration.find(params[:id])
    collab.update(status: "collaborator")
    redirect_to collaborations_path
  end

  def destroy
    collaboration = Collaboration.find(params[:id])
    project_id = collaboration.project_id
    collaboration.destroy
    redirect_to project_path(project_id)
  end

  private

  def collaboration_params
    params.require(:collaboration).permit(:user_id, :project_id, :status)
  end
end