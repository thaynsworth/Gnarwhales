class CommentsController < ApplicationController
  def create
    new_comment = Comment.create(comment_params)
    notif_params = notification_params
    commenter = User.find(notif_params[:user_id])
    project = Project.find(notif_params[:project_id])
    if commenter.id == project.user_id
      # Creator made the comment
      notif_params[:relation] = "collaborator"
      project.collabs.each do |collab|
        temp_params = notif_params
        notified_user = User.find(collab.user_id)
        temp_params[:description] = "#{commenter.name} commented on #{project.title}."
        temp_params[:user_id] = notified_user.id
        new_comment.notifications.create(temp_params)
      end
    else
      # Collaborator made the comment
    end
    binding.pry
    redirect_to project_path(params[:comment][:project_id])
  end
  def update
  end
  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to project_path(params[:project_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :project_id, :body)
  end

  def notification_params
    params.require(:notification).permit(:user_id, :project_id, :not_type, :description, :relation)
  end

end