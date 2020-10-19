class ActivitiesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :new, :create]

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

  private

  def activity_params
    params.require(:activity).permit(:titre, :description)
  end

end
