class Admin::BlogsController < ApplicationController
    before_action :authenticate_user!
    before_action :admin_required
    layout "admin"
	def index
		@blogs = Blog.all
	end

	def new
		@blog = Blog.new
		@topics = Topic.all.map {|c| [c.name, c.id]}
	end

	def show
		@blog = Blog.find(params[:id])
	end

	def edit
		@blog = Blog.find(params[:id])
    @topics = Topic.all.map {|c| [c.name, c.id]}
	end

	def create
		@blog = Blog.new(blog_params)
		@blog.topic_id = params[:topic_id]
		@blog.user = current_user
		if @blog.save
			redirect_to admin_blogs_path
		else
			render :new
		end
	end

	def update
		@blog = Blog.find(params[:id])
		if @blog.update(blog_params)
			redirect_to admin_blogs_path
		else
			render :edit
		end
	end

	def destroy
		@blog = Blog.find(params[:id])
		@blog.destroy
		flash[:alert]="Blog has deleted!"
    redirect_to admin_blogs_path
	end

	private
	def blog_params
		params.require(:blog).permit(:title,:description,:sketch,:image,:topic_id)
	end
end
