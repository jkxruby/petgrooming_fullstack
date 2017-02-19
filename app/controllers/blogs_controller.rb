class BlogsController < ApplicationController
	before_action :authenticate_user!
	def index
		@blogs = Blog.all 
	end

	def show
		@blog = Blog.find(params[:id])
	end


	private
	def blog_params
		params.require(:blog).permit(:title,:description,:image)
	end
end
