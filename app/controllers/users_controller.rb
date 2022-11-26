class UsersController < ApplicationController

  def index
    @users = User.all
    @paged_users = User.paginate(:page => params[:page], :per_page=>4)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :password)
  end

  def paged_user_params
    params.require(:user).permit(:email, :name, :page)
  end
end
