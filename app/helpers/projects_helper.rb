module ProjectsHelper
  def user_relation
    if @current_user.projects.include?(@project)
      @user_relation = "owner"
    elsif @current_user.collabs.include?(@project)
      @user_relation = "collaborator"
      collaboration_arr = Collaboration.all.select do |collab|
        collab.project_id == @project.id && @current_user.id == collab.project_id
      end
      @collaboration = collaboration_arr[0]
    else
      @user_relation = nil
    end
  end
end
