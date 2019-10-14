class UsersController < ApplicationController

    def index
        @users = User.all
    end

    def show
        @user = User.find(params[:id])
    end

    def new
        @user = User.new
    end

    def edit
        @user = User.find([:id])
    end

    def create
        @user = User.new(article_params)

        if @user.save
            redirect_to @user
        else
            render 'new'
        end
    end

    def update
        @user = User.find([:id])
        if @user.update(article_params)
            redirect_to @user
        else
            render 'edit'
        end
    end


    private
     def article_params
        params.require(:user).permit(:first_name,:last_name,:email_address,:password,:passwordconfirmation)
     end
end
