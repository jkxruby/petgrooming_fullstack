class BlogsController < ApplicationController
	layout 'blog'

	def index
    	if params[:topic].blank?
      		@blogs = Blog.all
   		else
      		@topic_id = Topic.find_by(name: params[:topic]).id
      		@blogs = Blog.where(:topic_id => @topic_id)
    	end
	end

	def show
		@blog = Blog.find(params[:id])
	end


	private
	def blog_params
		params.require(:blog).permit(:title,:description,:image)
	end
end
