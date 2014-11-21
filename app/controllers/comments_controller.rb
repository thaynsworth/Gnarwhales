class CommentsController < ApplicationController
  def create
  end
  def update
  end
  def destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :project_id, :body)
  end
end