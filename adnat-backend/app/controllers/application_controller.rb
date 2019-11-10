class ApplicationController < ActionController::Base
    helper_method :current_user

    def current_user
        if session[:id]
        puts session[:id]
        @user = User.find(session[:id])
        byebug
        @current_user ||= User.find(session[:id])
        puts @current_user
        return @current_user
        else
        @current_user = nil
        end
    end

end
