class SkillsController < ApplicationController

  def show
    @skill = Skill.find(params[:id])
  end

  def project_create
    skill = Skill.create(project_skill_params)
    redirect_to project_path(params[:skill][:project_id])
  end

  def user_create
    skill = Skill.create(user_skill_params)
    redirect_to user_path(params[:skill][:user_id])
  end


  private
  def project_skill_params
    params.require(:skill).permit(:skill, :project_id)
  end

  def user_skill_params
    params.require(:skill).permit(:skill, :user_id)
  end

end
