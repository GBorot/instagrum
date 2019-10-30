class LikesController < ApplicationController
  before_action :authenticate_account!
  before_action :find_post

  def save_like
    # @post = Like.new(post_id: params[:post_id], account_id: current_account.id)
    # @post.save!
    # redirect_to dashboard_path

    if @post.liked?(current_account)
      flash[:notice] = "You can't like more than once"
    else
      # @post = Like.new(post_id: params[:post_id], account_id: current_account.id)
      # @post.save!
      @post.likes.create(account_id: current_account.id)
    end
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


    unless @post.liked?(current_account)
      flash[:notice] = "Cannot unlike"
    else
      # @like.destroy
      @post.likes.delete(account_id: current_account.id)
    end
    redirect_to dashboard_path
  end

  # def delete_like
  #   # @post = Like.where(post_id: params[:post_id], account_id: current_account.id).destroy
  #   # @post.save!

  #   like.destroy
  #   redirect_to dashboard_path
  # end

  private

  def find_post
    @post = Post.find(params[:post_id])
  end
end
