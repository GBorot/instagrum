class LikesController < ApplicationController
  before_action :authenticate_account!
  before_action :find_post, :find_like

  def save_like
    @post.likes.create(account_id: current_account.id) unless @post.liked?(current_account)

    respond_to do |format|
      format.json {
        if @like.save
          { success: true }
        else
          { success: false }
        end
      }
    end



    # if @like.save
    #   respond_to do |format|
    #     format.html { redirect_to dashboard_path }
    #     format.js # will render "app/views/accounts/save_like.js.erb"
    #   end
    # end
    # redirect_to dashboard_path
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
