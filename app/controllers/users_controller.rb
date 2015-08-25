class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    puts "UsersController#show:line 9"
    p params

    @user = User.includes(:posts, :idols).find(params[:id]) #eager loading
    # unless @user == current_user
    #    redirect_to :back, alert: "Access denied." rescue redirect_to user_path
    # end
    
    puts "Current user ID:"
    p current_user.id
  end

  # def follow
  #   @user = User.includes(:posts, :idols).find(params[:id])
  #   @user.fans << current_user
  #   redirect_to user_path
  # end
end
