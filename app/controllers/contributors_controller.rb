class ContributorsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :new, :create, :show]

    def index
      @contributors = Contributor.all
    end
  
    def new
      @contributor = Activity.new
    end
  
    def create


    end
    
    def edit
      @contributor = Contributor.find(params[:id])
      
    end
  
    def destroy
      @contributor = Contributor.find(params[:id])
      @contributor.destroy
      redirect_to contributors_path
    end
  
    def show
      @contributor = Contributor.find(params[:id])
    end
  
    private
  
    def contributor_params
      params.require(:contributors_path).permit(:firstname, :lastname, :email)
    end
end
