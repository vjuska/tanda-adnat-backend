class UsersController < ApplicationController

    def show
        @user = User.find(params[:id])
    end

    def new
    end


    def create
    @user = User.new(article_params)

    @user.save
    redirect_to @user
    end


    private
     def article_params
        params.require(:user).permit(:first_name,:last_name,:email_address,:password,:passwordconfirmation)
     end
end
