class UsersController < ApplicationController
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

  

  def show
    @user = User.find(params[:id])
    @workouts= @user.workouts
  end

  def index
    @users = User.all
  end


  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :profile_image, :password, :password_confirmation)
  end
end
