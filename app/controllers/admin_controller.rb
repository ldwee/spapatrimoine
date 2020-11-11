class AdminController < ApplicationController
  def home
    @nbr_activities = Activity.where(status: "attente").count
    @nbr_actualities = Actuality.where(status: "attente").count
    @nbr_patrimoines = Patrimoine.where(status: "attente").count
  end

  def activities
    @pending_activities = Activity.where(status: "attente")
    @accepted_activities = Activity.where(status: "acceptée")
    @refused_activities = Activity.where(status: "refusée")
  end

  def actualities
    @pending_actualities = Actuality.where(status: "attente")
    @accepted_actualities = Actuality.where(status: "acceptée")
    @refused_actualities = Actuality.where(status: "refusée")
    @classified_actualities = Actuality.where(status: "classée")
  end

  def patrimoines
    @pending_patrimoines = Patrimoine.where(status: "attente")
    @accepted_patrimoines = Patrimoine.where(status: "acceptée")
    @refused_patrimoines = Patrimoine.where(status: "refusée")
  end


end
