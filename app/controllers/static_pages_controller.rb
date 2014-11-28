class StaticPagesController < ApplicationController
  def home
    # it doesn't look like this @disable_nav variable has any purpose.
    @disable_nav = true
    if logged_in?
    	redirect_to projects_path
    end
  end

  def notifications
  	@notifications = @current_user.notifications
    # move the below logic to a method on your User model.
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
    # same with this.
    @current_user.collaborations.each do |collab|
      if collab.status == "invited"
        @invited_collaborations[collab.id] = {
          user: User.find(collab.user_id).name,
          project: Project.find(collab.project_id),
          status: collab.status}
      end
    end
  end


end
