class LikesController < ApplicationController
  before_action :authenticate_account!

  def save_like
    @post = Like.new(post_id: params[:post_id], account_id: current_account.id)
    @post.save!
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
    # @post = Like.where(post_id: params[:post_id], account_id: current_account.id).destroy
    # @post.save!

    like.destroy
    redirect_to dashboard_path
  end
end
