class ActivitiesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :new, :create, :show]

  def index
    @activities = Activity.where(status:"acceptée")
  end

  def new
    @activity = Activity.new
  end

  def create
    @activity = Activity.new(activity_params)
    @activity.status = "attente"
    if @activity.save
      flash[:notice] = 'Votre proposition est bien reçue, merci beaucoup.  Nous revenons vers vous pour une suite'
      redirect_to activities_path
    else
      render :new
    end
  end
  
  def edit
    @activity = Activity.find(params[:id])
    @activity_types = ActivityType.all
  end

  def update
    @activity = Activity.find(params[:id])
    p @activity_types
    if @activity.update(activity_params)
      flash[:notice] = 'Bien fait, merci'
      redirect_to "/admin/activités"
    else
      render :edit
    end
  end

  def show
    @activity = Activity.find(params[:id])
  end

  private

  def activity_params
    params.require(:activity).permit(:title, :description, :image, :status, :date, :activity_type_id)
  end

end
