class UsersController < ApplicationController
  def edit
  end

  def update
  end

  # def destroy
  #   # user = User.find(params[:id])
  #   # user.destroy
  # end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
