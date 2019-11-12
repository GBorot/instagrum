class LikesController < ApplicationController
  before_action :authenticate_account!
  before_action :find_post, :find_like

  def save_like
    @post.likes.create(account_id: current_account.id) unless @post.liked?(current_account)

    redirect_to dashboard_path

    # faire en AJAX

    # respond_to do |format|
    #   format.js {
    #     if @like.save!
    #       { success: true }
    #     else
    #       { success: false }
    #     end
    #   }
    # end
  end

  def destroy
    @like.destroy
    redirect_to dashboard_path
  end

  private

  def find_like
    @like = Like.find_by(account: current_account, post: @post)
  end

  def find_post
    @post = Post.find(params[:id] || params[:post_id])
  end
end
