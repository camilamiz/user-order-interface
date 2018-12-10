class UsersController < ApplicationController
  # def index
  #   @users = User.all
  # end

  def show
    @user = User.find(params[:id])
    @order = Order.new
  end

  # def new
  #   @user = User.new
  # end

  def create
    @user = User.new(user_params)

    if @user.save
      respond_to do |format|
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render action: 'show', status: :created, location: @user }
      end
    else
      respond_to do |format|
        format.html { redirect_to root_path }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :cpf, :email)
  end
end
