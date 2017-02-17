class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  before_action :set_comment, only: [:destroy]

  def create
    @service = Service.find(params[:service_id])
    @comment = @service.comments.new(comment_params)
    @comment.user = current_user

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @service, notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { redirect_to @service, alert: 'You have to write some words' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end



  def destroy
    @service = Service.find(params[:service_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to @service, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:service_id, :body, :user_id)
    end
end
