class VisitorsController < ApplicationController

	def index
		@tweets = Post.includes(:user).reverse_order.first(10)
	end
end
