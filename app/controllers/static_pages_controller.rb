class StaticPagesController < ApplicationController
  def home
    @disable_nav = true
  end

  def help
  end

end
