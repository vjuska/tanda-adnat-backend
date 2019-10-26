class OrganisationsController < ApplicationController
    def index
        @organisation = Organisation.all
    end

    def show
        redirect_to action:"index"
    end

    def new
        @organisation = Organisation.new
    end

    def edit
        @organisation = Organisation.find(params[:id])
    end

    def create
        @organisation = Organisation.new(orgs_params)

        if @organisation.save
            redirect_to @organisation
        else
            render 'new'
        end
    end

    def update
        @organisation = Organisation.find(params[:id])
        if @organisation.update(orgs_params)
            redirect_to @organisation
        else
            render 'edit'
        end
    end

    def destroy
        @organisation = Organisation.find(params[:id])
        @organisation.destroy
 
        redirect_to organisations_path
    end

    private
     def orgs_params
        params.require(:organisation).permit(:org_name,:hourly_rate)
     end
end
