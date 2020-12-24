class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @nickname = @user.nickname
    
    
  end
end

def user_params
  params.require(:user).permit(:nickname, :first_name, :last_name, :first_name_kana, :last_name_kana, :sex, :age, :birthday).merge(user_id: current_user.id)
end