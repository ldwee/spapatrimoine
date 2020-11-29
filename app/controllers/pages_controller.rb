class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @actualities = Actuality.where(status: "acceptée")
    @actualities_rest = @actualities.drop(1)
  end

  def about
  end
end
