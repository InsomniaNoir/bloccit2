class UsersController < ApplicationController
  before_action :authenticate_user!

  def update
    if current_user.update_attributes(user_params)
      flash[:notice] = "User Information Updated"
      redirect_to edit_user_registration_path
    else
      flash[:error] = "Invalid User Information"
      redirect_to edit_user_registration_path
    end
  end

private

  def user_params
    params_require(:user).permit(:name)
  end
end
