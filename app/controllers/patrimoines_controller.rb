class PatrimoinesController < ApplicationController

    before_action :authenticate_user!, except: [:index, :new, :create, :show]

    def index
      @patrimoines = Patrimoine.where(status:"acceptée")
    end
  
    def new
      @patrimoine = Patrimoine.new
    end
  
    def create
      @patrimoine = Patrimoine.new(patrimoine_params)
      @patrimoine.status = "attente"
      if @patrimoine.save
        flash[:notice] = 'Votre proposition est bien reçue, merci beaucoup.  Nous revenons vers vous pour une suite'
        redirect_to patrimoines_path
      else
        render :new
      end
    end
    
    def edit
      @patrimoine = Patrimoine.find(params[:id])

    end
  
    def update
      @patrimoine = Patrimoine.find(params[:id])
      if @patrimoine.update(patrimoine_params)
        flash[:notice] = 'Bien fait, merci'
        redirect_to "/admin/patrimoines"
      else
        render :edit
      end
    end
  
    def destroy
      @patrimoine = Patrimoine.find(params[:id])
      @patrimoine.destroy
      redirect_to patrimoines_path
    end
  
    def show
      @patrimoine = Patrimoine.find(params[:id])
    end
  
    private
  
    def patrimoine_params
      params.require(:patrimoine).permit(:libelle, :illustration, :localisation, :inscription, :categorie, :notice, :etat, :endangered, :status, :ipic)
    end
  
  end
