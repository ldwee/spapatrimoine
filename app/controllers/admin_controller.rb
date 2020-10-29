class AdminController < ApplicationController
  def home
    @nbr_activities = Activity.where(status: "attente").count
  end

  def activities
    @pending_activities = Activity.where(status: "attente")
    @accepted_activities = Activity.where(status: "acceptée")
    @refused_activities = Activity.where(status: "refusée")
  end

  def activity_types 
    @activity_types = ActivityType.all
  end

  def activity_type_new
    @activity_type = ActivityType.new
  end

  def activity_type_create
    @activity_type = ActivityType.new(activity_type_params)
    if @activity_type.save
      redirect_to activity_types_path
    else
      render :new
    end
  end

  private

  def activity_type_params
    params.require(:activity_type).permit(:title)
  end

end
