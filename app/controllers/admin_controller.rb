class AdminController < ApplicationController
  def home
    @nbr_activities = Activity.where(status: "attente").count
  end
end
