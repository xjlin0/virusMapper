class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.includes(:posts, :idols, :fans).find(params[:id]) #eager loading
    # unless @user == current_user
    #    redirect_to :back, alert: "Access denied." rescue redirect_to user_path
    # end
    #@post = Post.new #for form_for post
  end

end
