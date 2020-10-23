class ApplicationController < ActionController::Base
  before_action :logged_in_user?
  before_action :authorized?

  skip_before_action :authorized?, only: :home

  def logged_in_user?
    @current_user = User.find_by(id: session[:user_id])
  end

  def authorized?
    # flash[:not_authorized] = "You need to create an account or login to see this!"
    redirect_to new_login_path unless logged_in_user?
  end

  def home
  end
end
