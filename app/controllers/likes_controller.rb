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

  def delete_like
    @like.destroy unless @post.liked?(current_account)

    # unless @post.liked?(current_account)
    #   flash[:notice] = "Cannot unlike"
    # else
    #   @like.destroy
    #   # @post.likes.delete(account_id: current_account.id
    # end
    redirect_to dashboard_path
  end

  private

  def find_like
    @like = Like.where(account_id: current_account.id, post_id: @post.id)
  end

  def find_post
    @post = Post.find(params[:post_id])
  end
end
