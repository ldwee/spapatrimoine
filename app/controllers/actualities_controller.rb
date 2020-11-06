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
      
      @contributor = Contributor.find_by(email: params[:actuality][:contributors][:email])

      if @contributor.nil?
        @contributor = Contributor.new(contributor_params)
      end
  
      @actuality.contributor = @contributor     
      
      if @actuality.save && @contributor.save
        flash[:notice] = 'Votre proposition est bien reçue, merci beaucoup.  Nous revenons vers vous pour une suite'
        redirect_to actualities_path
      else
        render :new
      end
    end
    
    def edit
      @actuality = Actuality.find(params[:id])
      @activities = Activity.all
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
  
    def destroy
      @actuality = Actuality.find(params[:id])
      @actuality.destroy
      redirect_to actualities_path
    end

    private
  
    def actuality_params
      params.require(:actuality).permit(:titre, :description, :status, :image, :activity_id, :contributor_id)
    end
    
    def contributor_params
      params.require(:actuality).require(:contributors).permit(:firstname, :lastname, :email)
    end
    

end
