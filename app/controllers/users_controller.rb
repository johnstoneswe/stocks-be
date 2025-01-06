class UsersController < ApplicationController
  skip_before_action :create

  def create
    @user = User.create!(user_params)

    session[:user_id] = user.id

    render json: user
  end

  def show
    user = session[params[:user_id]]

    render json: user, status: :ok
  end

  private

  def user_params
    params.permit(:username, :email, :password, :password_confirmation)
  end
end
