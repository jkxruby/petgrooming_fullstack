class BlogsController < ApplicationController
	before_action :authenticate_user!
	def index
		@blogs = Blog.all 
	end

	def new
		@blog = Blog.new
	end

	def show
		@blog = Blog.find(params[:id])
	end

	def edit
		@blog = Blog.find(params[:id])
	end

	def create
		@blog = Blog.new(blog_params)
		@blog.user = current_user
		if @blog.save
			redirect_to blogs_path
		else
			render :new
		end
	end

	def update
		@blog = Blog.find(params[:id])
		if @blog.update(blog_params)
			redirect_to blogs_path
		else
			render :edit
		end
	end

	def destroy
		@blog = Blog.find(params[:id])
		@blog.destroy
		flash[:alert]="Blog has deleted!"
	end

	private
	def blog_params
		params.require(:blog).permit(:title,:description,:image)
	end
end
