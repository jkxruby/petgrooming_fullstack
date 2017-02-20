class MessagesController < ApplicationController
	before_action :authenticate_user!, only: [:create, :destroy]

	def create
		@blog = Blog.find(params[:blog_id])
		@message = @blog.messages.new(message_params)
		@message.user = current_user

		if @message.save
			redirect_to blog_path(@blog), notice: 'Review was successfully created!'
		else
  			redirect_to blog_path(@blog), alert: "Comment can't be blank!"
		end
	end

  	def destroy
    	@blog = Blog.find(params[:blog_id])
    	@message = Message.find(params[:id])
    	@message.destroy
    	redirect_to blog_path(@blog), alert: "You have deleted the comment successfully"
  end

  private


    # Never trust parameters from the scary internet, only allow the white list through.
def message_params
  params.require(:message).permit(:blog_id, :body, :user_id)
end
end
