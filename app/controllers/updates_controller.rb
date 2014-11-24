class UpdatesController < ApplicationController

  def create
  @update = Update.new(update_params)
  @update.project_id = params[:project_id]

  @update.save

  redirect_to project_path(@update.project)
end

def update_params
  params.require(:update).permit(:user_id, :body)
end


end
