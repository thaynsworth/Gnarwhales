class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update]
  before_action :correct_user,   only: [:edit, :update]

  def index

    # You could make this line more expressive by using ActiveRecord scopes.
    # not something we've talked about explicitly.  Just FYI.
    # You could call something like User.alphabatized.
    @users = User.all.group_by{|u| u.name[0]}
    @letters = ("A".."Z").to_a

  end

  def show

    # Its not clear to me what the disctinctino between @user and @current_user
    # is.  This could be a good use case for a comment.

    @user = User.find(params[:id])
    @my_projects = @current_user.projects

  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      # do you really want to say 'Sample App'?
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(profile_params)
       flash[:success] = "Profile updated"
       redirect_to @user
    else
      render 'edit'
    end
  end

  private

    def user_params

      params.require(:user).permit(:name, :email, :password, :website, :location, :summary,
                                   :password_confirmation)
    end

    # this is clever
    def profile_params
       params.require(:user).permit(:name, :email, :website, :location, :summary)
    end

    def logged_in_user
      unless logged_in?
      	store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end


    # i don't totally understand this method. could be a good time
    # for a comment.  also, if you are setting @user in the before_action
    # you don't need to set it in the action.

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
end
