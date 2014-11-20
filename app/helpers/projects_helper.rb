module ProjectsHelper
  def user_relation
    if @current_user.projects.include?(@project)
      @user_relation = "owner"
    elsif @current_user.collabs.include?(@project)
      @user_relation = "collaborator"
    else
      @user_relation = nil
    end
  end
end
