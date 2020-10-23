class UsersController < ApplicationController
    before_action :find_user, only: [:show, :edit, :update, :destroy]
    skip_before_action :authorized?, only: [:new, :create]

    def index
        @users = User.all
    end

    def show
        if @current_user != @user
            # redirect_to #somewhere
        end

        if params[:game_list]
            @user_games = @user.filter_games(params[:game_list])
        else
            @user_games = @user.games
        end
    end

    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        if @user.valid?
            session[:user_id] = @user.id
            redirect_to new_system_user_path
        else
            flash[:my_errors] = @user.errors.full_messages
            redirect_to new_user_path
        end
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        @user.update(user_params)
        redirect_to user_path(@user)
    end

    def destroy
        @user.destroy
        flash[:account_delete] = "Your account has been deleted."
        redirect_to root_path
    end

    private

    def find_user
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:name, :username, :email, :password, :age, :interest)
    end
end
