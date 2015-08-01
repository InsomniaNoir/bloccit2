class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:show]

  def index
    @users = User.top_rated.paginate(page: params[:page], per_page: 10)
  end

  def update
    if current_user.update_attributes(user_params)
      flash[:notice] = "User Information Updated"
      redirect_to edit_user_registration_path
    else
      flash[:error] = "Invalid User Information"
      redirect_to edit_user_registration_path
    end
  end

  def show
    @user = User.find(params[:id])
    @posts = Post.visible_to(current_user)
    @comments = @user.comments
  end

private

  def user_params
    params.require(:user).permit(:name, :avatar, :email_favorites)
  end
end
