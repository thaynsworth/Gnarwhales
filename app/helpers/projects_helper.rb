module ProjectsHelper
  def user_relation
    if @current_user.projects.include?(@project)
      @user_relation = "owner"
    elsif @current_user.pending_collabs.include?(@project)
      @user_relation = "pending"
    elsif @current_user.collabs.include?(@project)
      @user_relation = "collaborator"

      collaboration_arr = Collaboration.all.select do |collab|
        collab.project_id == @project.id && @current_user.id == collab.user_id
      end
      @collaboration = collaboration_arr[0]
    else
      @user_relation = nil
      collaboration_arr = Collaboration.all.select do |collab|
        collab.project_id == @project.id && @current_user.id == collab.user_id
      end
      @collaboration = collaboration_arr[0]
    end
  end
end
