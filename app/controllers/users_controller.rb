class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @workouts = @user.workouts
  end

  def new
    @user = User.new
  end

  def create
      @user = User.new(user_params)
      if @user.save
        log_in @user
        redirect_to root_path , notice: "Thanks for signing up"
        flash[:success]= "Hello #{@user.first_name}"
      else
        render :new
      end
  end

  def edit
     @user = User.find(params[:id])
  end

  def update
    @user = User.find params[:id]
      if @user.update user_params
        redirect_to user_path
      else
        render :edit
      end
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :profile_image, :password, :password_confirmation)
  end
end

#           <%= (image_tag attachment_url(user, :profile_image, :fill, 50, 50, format: "jpg"), :class => "squarish-img")  %>
