class VisitorsController < ApplicationController

	def index
		@tweets = Post.includes(:user).last(5)
	end
end
