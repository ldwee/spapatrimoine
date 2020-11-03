class ActualitiesController < ApplicationController
    before_action :authenticate_user!, except: [:index, :new, :create, :show]

    def index
      @actualities = Actuality.where(status:"acceptée")
    end
  
    def new
      @actuality = Actuality.new
    end
  
    def create
      @actuality = Actuality.new(actuality_params)
      @actuality.status = "attente"
      if @actuality.save
        flash[:notice] = 'Votre proposition est bien reçue, merci beaucoup.  Nous revenons vers vous pour une suite'
        redirect_to actualities_path
      else
        render :new
      end
    end
    
    def edit
      @actuality = Actuality.find(params[:id])
     
    end
  
    def update
      @actuality = Actuality.find(params[:id])
      if @actuality.update(actuality_params)
        flash[:notice] = 'Bien fait, merci'
        redirect_to "/admin/actualités"
      else
        render :edit
      end
    end
  
    def show
      @actuality = Actuality.find(params[:id])
    end
  
    private
  
    def actuality_params
      params.require(:actuality).permit(:titre, :description, :status, :image)
    end
  
end
