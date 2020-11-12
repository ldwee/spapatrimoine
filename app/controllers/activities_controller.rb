class ActivitiesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :new, :create, :show]

  def index
    @activities = Activity.where(status:"acceptée")
  end

  def new
    @activity = Activity.new
    @accepted_patrimoines = Patrimoine.where(status: "acceptée")
  end

  def create
    @activity = Activity.new(activity_params)
    @accepted_patrimoines = Patrimoine.where(status: "acceptée")
    @activity.status = "attente"
    
    @contributor = Contributor.find_by(email: params[:activity][:contributors][:email])

    if @contributor.nil?
      @contributor = Contributor.new(contributor_params)
    end

    @activity.contributor = @contributor

    if @activity.save && @contributor.save
      flash[:notice] = 'Votre proposition est bien reçue, merci beaucoup.  Nous revenons vers vous pour une suite'
      redirect_to activities_path
    else
      render :new
    end
  end
  
  def edit
    @activity = Activity.find(params[:id])
    @accepted_patrimoines = Patrimoine.where(status: "acceptée")
    @activity_types = ActivityType.all
    @activity_places = ActivityPlace.all
  end

  def update
    @activity = Activity.find(params[:id])
    @accepted_patrimoines = Patrimoine.where(status: "acceptée")
    if @activity.update(activity_params)
      if @activity.status != "acceptée" 
        flash[:notice] = 'Bien fait, merci'
        redirect_to "/admin/activités"
      else
        if @activity.date.nil? == false && @activity.activity_place_id.nil? == false && @activity.activity_type_id.nil? == false
          flash[:notice] = 'Bien fait, merci'
          redirect_to "/admin/activités"
        else
          flash[:notice] = "Avant d'accepter une activité, complétez la date, le lieu et le type svp"
          render :edit
        end
      end
    else
      render :edit
    end
  end

  def show
    @activity = Activity.find(params[:id])
  end

  def destroy
    @activity = Activity.find(params[:id])
    @activity.destroy
    redirect_to "/admin/activités"
  end

  private

  def activity_params
    params.require(:activity).permit(:title, :description, :image, :status, :date, :patrimoine_id, :activity_type_id, :activity_place_id, :contributor_id)
  end

  def contributor_params
    params.require(:activity).require(:contributors).permit(:firstname, :lastname, :email)
  end

end
