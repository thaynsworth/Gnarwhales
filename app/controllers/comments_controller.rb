class CommentsController < ApplicationController
  def create
    new_comment = Comment.create(comment_params)
    redirect_to project_path(params[:comment][:project_id])
  end
  def update
  end
  def destroy
    binding.pry
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to project_path(params[:project_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :project_id, :body)
  end
end