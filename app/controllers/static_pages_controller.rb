class StaticPagesController < ApplicationController
  def home
    @disable_nav = true
    if logged_in?
    	redirect_to projects_path
    end 
  end

  def notifications 
  	@notifications = @current_user.notifications
    @pending_collaborations = {}
    @current_user.projects.each do |project|
      project.collaborations.each do |collab|
        if collab.status == "pending"
          @pending_collaborations[collab.id] = {
            user: User.find(collab.user_id).name,
            project: project.title,
            status: collab.status}
          end
      end
    end
    @invited_collaborations = {}
    @current_user.collaborations.each do |collab|
      if collab.status == "invited"
        @invited_collaborations[collab.id] = {
          user: User.find(collab.user_id).name,
          project: Project.find(collab.project_id).id,
          status: collab.status}
      end
    end
  end


end
