class UsersController < ApplicationController

  def index
    @users = User.all
    @paged_users = User.paginate(:page => params[:page], :per_page=>4)
  end

  private

  def paged_user_params
    params.require(:user).permit(:email, :name, :page)
  end
end
