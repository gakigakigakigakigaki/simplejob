class MemosController < ApplicationController 
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]

  def index
    @memo = Memo.new
    @user = current_user
    @memos = Memo.where(user_id: current_user).order(start_time: "desc", end_time: "desc")
  end

  def edit
  
  end

  def create
    memo = Memo.new(memos_params)
    if memo.user_id = current_user.id
      memo.save
        flash[:notice] = "シフトを記録しました"
         redirect_to memos_path
    else
      render :index
    end
  end

  def update
    if @memo.update(memos_params)
       flash[:notice] = "シフトを更新しました"
       redirect_to memos_path
    else
      render :edit
    end
  end

  def destroy
    @memo.destroy
    flash[:notice] = "シフトを削除しました"
    redirect_to memos_path
  end

  def ensure_correct_user
    @memo = Memo.find(params[:id])
      unless @memo.user == current_user
        redirect_to memos_path
      end
  end

  private
    def memos_params
      params.require(:memo).permit(:title,:custoer_id,:start_time,:end_time)
    end
end
