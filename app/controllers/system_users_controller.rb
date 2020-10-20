class SystemUsersController < ApplicationController

    def new
        @system_user = SystemUser.new
    end
    
    def create
        @system = SystemUser.new(su_params)
        @system.user_id = @current_user.id if @current_user 
        @system.save

        redirect_to user_path(@system.user)
    end

    def edit
        @system = SystemUser.find(params[:id])
    end

    def update
        @system = SystemUser.find(params[:id])
        @system.update(su_params)
        redirect_to user_path(@system.user)
    end

    private
    def su_params
        params.require(:system_user).permit(:user_id, :system_id)
    end
end
