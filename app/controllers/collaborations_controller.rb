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
    notif_params = notification_params
    project = Project.find(params[:notification][:project_id])
    creator_id = User.find(project.user_id).id
    notif_params[:user_id] = creator_id
    new_collab.notifications.create(notif_params)
    redirect_to project_path(params[:collaboration][:project_id])
  end

  def update
    collab = Collaboration.find(params[:id])
    collab.update(status: "collaborator")
    notif_params = notification_params
    accepted_user = User.find(collab.user_id)
    notif_params[:user_id] = accepted_user.id
    project = Project.find(collab.project_id)
    notif_params[:project_id] = project.id
    notif_params[:description] = "You have been accepted to collaborate on #{project.title}!"
    binding.pry
    noter = collab.notifications.create(notif_params)
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

  def notification_params
    params.require(:notification).permit(:user_id, :project_id, :not_type, :description, :relation)
  end
end



















