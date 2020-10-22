class SystemUsersController < ApplicationController

    def new
        @system_user = SystemUser.new
    end
    
    def create
        
        @system = SystemUser.new(su_params)
        @system.user_id = @current_user.id if @current_user 
        
        if @system.valid?
            @system.save
            redirect_to user_path(@system.user)
        else
            flash[:errors] = "System already added"
            redirect_to new_system_user_path
        end
    end

    def edit
        @system = SystemUser.find(params[:id])
    end

    def update
        @system = SystemUser.find(params[:id])
        @system.update(su_params)
        redirect_to user_path(@system.user)
    end

    def destroy
        @system_user = SystemUser.find(params[:id])
        @system_user.destroy
        redirect_to user_path(@system_user.user)
    end

    private
    def su_params
        params.require(:system_user).permit(:user_id, :system_id)
    end
end
