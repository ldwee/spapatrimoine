class AdminController < ApplicationController
  def home
    @nbr_activities = Activity.where(status: "attente").count
  end

  def activities
    @pending_activities = Activity.where(status: "attente")
    @accepted_activities = Activity.where(status: "acceptée")
    @refused_activities = Activity.where(status: "refusée")
  end


  
end
