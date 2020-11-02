class ActivityPlacesController < ApplicationController
    
    def index 
        @activity_places = ActivityPlace.all
    end

    def new
        @activity_place = ActivityPlace.new
    end

    def create
        @activity_place = ActivityPlace.new(activity_place_params)
        if @activity_place.save
            redirect_to "/activity_places"
        else
            render :new
        end
    end

    private

    def activity_place_params
        params.require(:activity_place).permit(:Name, :Address)
    end

end
