class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.includes(:idols).find(params[:id]) #eager loading
    @posts = Post.includes(:user).where(user_id: @user.idols.pluck(:id) + [@user.id] ).last(10) #Get all posts from user and user's idols
    # unless @user == current_user
    #    redirect_to :back, alert: "Access denied." rescue redirect_to user_path
    # end
    #@post = Post.new #for form_for post
  end

end
