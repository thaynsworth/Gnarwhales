class StaticPagesController < ApplicationController
  def home
    @disable_nav = true
  end

  def notifications 
  	@notifications = @current_user.notifications
  



    @collaborations = {}
    @current_user.projects.each do |project|
      project.collaborations.each do |collab|
        if collab.status == "pending"
          @collaborations[collab.id] = {
            user: User.find(collab.user_id).name,
            project: project.title,
            status: collab.status}
          end
      end
    end
end



end
