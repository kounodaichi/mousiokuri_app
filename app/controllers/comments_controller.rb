# frozen_string_literal: true

class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.new(comment_params)
    redirect_back(fallback_location: root_path)
  end

  private

  def comment_params
    params.require(:comment).permit(:comment_content, :post_id, :category)  # formにてpost_idパラメータを送信して、コメントへpost_idを格納するようにする必要がある。
  end
end
