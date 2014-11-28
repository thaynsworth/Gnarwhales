module ProjectsHelper


  # this method is pretty difficult to read.  could it be broken out into
  # multiple methods?  Also, you might want to look into ActiveRecord
  # scopes on your Collaboration model.  It would dry up lines 15-23.

  def user_relation
    if @current_user.projects.include?(@project)
      @user_relation = "creator"
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

  def gravatar_for(user)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end
end
