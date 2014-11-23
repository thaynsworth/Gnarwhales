class CommentsController < ApplicationController
  def create
    new_comment = Comment.create(comment_params)
    notif_params = notification_params
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