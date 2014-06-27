class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include Pundit
  protect_from_forgery with: :exception
  helper_method :current_user


    def current_user
    @current_user = super
      unless @current_user
        @current_user = User.new(username: "")
      else
        @current_user
      end
    end

  private

  def user_not_authorized
    flash[:error] = t "not_authorized"
    redirect_to(request.referrer || root_path)
  end

end
