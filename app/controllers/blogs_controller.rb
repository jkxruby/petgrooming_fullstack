class BlogsController < ApplicationController
	before_action :authenticate_user!, only: [:upvote, :downvote]
	layout 'blog'

	def index
    	if params[:topic].blank?
      		@blogs = Blog.all
					@blogs = @blogs.recent.paginate(:page => params[:page], :per_page => 3)
   		else
      		@topic_id = Topic.find_by(name: params[:topic]).id
      		@blogs = Blog.where(:topic_id => @topic_id)
					@blogs = @blogs.recent.paginate(:page => params[:page], :per_page => 3)
    	end
	end

	def show
		@blog = Blog.find(params[:id])
	end


	def upvote
		@blog = Blog.find(params[:id])
		@blog.upvote_by current_user
		redirect_to :back
	end

	def downvote
		@blog = Blog.find(params[:id])
		@blog.downvote_by current_user
		redirect_to :back
	end

	private
	def blog_params
		params.require(:blog).permit(:title,:description,:image)
	end
end
