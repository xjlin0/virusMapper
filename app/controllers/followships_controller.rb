class FollowshipsController < ApplicationController
  before_action :authenticate_user!

  # def new
  # end

  def create
    puts "FollowshipsController#show:line 8"
    p params
    @user = User.includes(:fans).find(params[:user_id])
    @user.fans << current_user
    redirect_to user_path(params[:user_id])
  end

  def index
    puts "FollowshipsController#show:line 16"
    @my_fans = current_user.fans
    @my_idols= current_user.idols
    p params  #Do I need partials?
    
  end

  def destroy
    puts "FollowshipsController#show:line 23"
    p params
    @user = User.includes(:fans).find(params[:user_id])
    @user.fans.delete(current_user)
    redirect_to user_path(params[:user_id])
  end
end
