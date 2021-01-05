class RelationshipsController < ApplicationController
  before_action :set_user

  def create
    following = current_user.follow(@user)
    if folowing.save
      flash[:success]  = '企業をフォローしました'
      redirect_to @user
    else
      flash.now[:alert] = '企業のフォローに失敗しました'
      redirect_to @user
    end

  def destroy
    following = current_user.unfollow(@user)
    if following.destroy
      flash[:success] = '企業のフォローを解除しました'
      redirect_to @user
    else
      flash.now[:alert] = '企業のフォロー解除に失敗しました'
      redirect_to @user
    end
end

private
def
  @user = User.find(params[:relationship][:follw_id])
end
end
  