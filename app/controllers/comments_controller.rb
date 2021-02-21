class CommentsController < ApplicationController
  
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      ActionCable.server.broadcast 'comment_channel', content: @comment
      # redirect_to result_path(@comment.result)
    # else
    #   @result = @comment.result
    #   @comments = @result.comments
    #   render "results/show"
    end
  end

  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, result_id: params[:result_id])

  
end
