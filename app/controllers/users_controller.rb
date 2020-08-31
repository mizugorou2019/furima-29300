class UsersController < ApplicationController
  def edit
  end

  def update
    # if current_user.update(user_params)
    #   redirect_to root_path
    # else
    #   render :edit
    # end
  end

  # deviseの内部コントローラーがやってくれるので不要
  # def new
  # end

  # def create
  # end

  # def destroy
  #   # user = User.find(params[:id])
  #   # user.destroy
  # end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
