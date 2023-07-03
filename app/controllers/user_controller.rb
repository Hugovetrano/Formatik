class UsersController < ApplicationController
    def index
        @users = User.all
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            redirect_to user_path
        else
            render :new
        end
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            redirect_to user_path(@user)
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @intervenant = Intervenant.find(params[:id])
        @intervenant.destroy
        redirect_to intervenants_path, status: :see_other
    end

    private

    def user_params
        params.require(:user).permit(:genre, :prenom, :nom, :email, :password, :fonction, :photo)
    end


end
