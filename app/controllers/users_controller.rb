class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update]

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    # @user = User.new(username: params[:username], password: params[:password], email: params[:email])
    @user = User.new(user_params)
    if @user.save
      respond_to do |format|
        format.html { redirect_to user_path(@user), status: :created, location: @user }
        format.json { render json: @user, status: :created }
      end
    else
      respond_to do |format|
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user, status: :unprocessable_entity }
      end
    end
  end

  def update
    # @user = User.new(username: params[:username], password: params[:password], email: params[:email])
    if @user.update(user_params)
      respond_to do |format|
        format.html { redirect_to user_path(@user), status: :ok, location: @user }
        format.json { render json: @user, status: :ok }
      end
    else
      respond_to do |format|
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user, status: :unprocessable_entity }
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :email)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
