class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

	def after_sign_in_path_for(resource)
	  user_path(current_user)
	end #http://stackoverflow.com/questions/6405941

  def search    # GET /search/term.json
  	p params
  	p "ApplicationController line 12"
  	p term     = params[:term]
  	@results = term.nil? ? [] : User.search(name: term) #+ Post.search(content: term)
    respond_to { |format| format.json { render json: @results } }
  end  # Search results get no ranking here

end