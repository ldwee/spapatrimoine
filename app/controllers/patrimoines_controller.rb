class PatrimoinesController < ApplicationController

    before_action :authenticate_user!, except: [:index, :new, :create, :show]

    def index
      @patrimoines = Patrimoine.where(status:"acceptée")

      @markers = @patrimoines.geocoded.map do |patrimoine|
        {
          lat: patrimoine.latitude,
          lng: patrimoine.longitude
        }
      end
    end

    def new
      @patrimoine = Patrimoine.new
    end

    def create
      @patrimoine = Patrimoine.new(patrimoine_params)
      @patrimoine.status = "attente"
     p "---------------------------"
      p patrimoine_params

      # check if contributor already exists
      @contributor = Contributor.find_by(email: params[:patrimoine][:contributors][:email])

      # if contributor doesnt exist, create a new one
      if @contributor.nil?
        @contributor = Contributor.new(contributor_params)
      end

      # link that contributor to the new patrimoine
      @patrimoine.contributor = @contributor

      if @patrimoine.save && @contributor.save
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
      redirect_to "/admin/patrimoines"
    end

    def show
      @patrimoine = Patrimoine.find(params[:id])
    end

    private

    def patrimoine_params
      params.require(:patrimoine).permit(:libelle, :images, :localisation, :inscription, :categorie, :notice, :etat, :endangered, :status, :ipic, :contributor_id)
    end

    def contributor_params
      params.require(:patrimoine).require(:contributors).permit(:firstname, :lastname, :email)
    end

  end
