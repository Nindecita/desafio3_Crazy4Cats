class LikeController < ApplicationController
  def create
    @like = current_user.likes.new(like_params)

    if !@like.save
      flash[:notice] = @like.errors.full_messages.to_sentence
    end

  redirect_to @like.comment
end

  def destroy
    @like = current_user.likes.find(params[:id])
    comment = @like.comment
    @like.destroy
    redirect_to comment
  end

  private

  def like_params
  params.require(:like).permit(:comments_id)
  end
end
