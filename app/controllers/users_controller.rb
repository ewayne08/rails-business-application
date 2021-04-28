class UsersController < ApplicationController

    #before_action :redirect_if_logged_in, except: [:show]

    def new
        @user = User.new
    end
    
    def index
        @users = User.all 
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render :new
        end
    end

    def show
        @user = User.find(params[:id])
    end

    def edit
        @user = User.find(params[:id])
        if current_user != @user
            redirect_to user_path
        end
    end

    def update
        @user = User.find_by_id(params[:id])
        if @user.update(params.require(:user).permit(:username, :profile_pic, :bio))
            redirect_to user_path(@user)
            else
            render :edit
        end
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        redirect_to '/login'
    end



    private

    def user_params
        params.require(:user).permit(:username, :email, :password, :profile_pic, :bio)
    end

end
