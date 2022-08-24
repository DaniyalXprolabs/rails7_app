# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :authenticate_user!, only: %i[create destroy]
  before_action :get_post, only: %i[create destroy index]

  def index
    @comments = @post.comments.all
  end

  def create
    @comment = @post.comments.create(comment_params)
    @comment.user = current_user
    if @comment.save
      flash[:notice] = 'Comment created successfully'
    else
      flash[:alert] = 'Comment not created'
    end
    redirect_to @post
  end

  def destroy
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to @post
  end

  private

  def get_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
