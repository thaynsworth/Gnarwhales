class SkillsController < ApplicationController

  def show
    @skill = Skill.find(params[:id])
  end

  def project_create
    project = Project.find(params[:project_id])
    project.skills.create(skill_params)
    redirect_to project_path(params[:project_id])
  end

  def user_create
    user = User.find(params[:id])
    user.skills.create(skill_params)
    redirect_to user_path(params[:user_id])
  end


  private
  def skill_params
    params.require(:skill).permit(:skill)
  end

end
