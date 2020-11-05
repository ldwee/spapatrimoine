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

    def edit
        @activity_place = ActivityPlace.find(params[:id])
    end

    def update
        @activity_place = ActivityPlace.find(params[:id])
        if @activity_place.update(activity_place_params)
          flash[:notice] = 'Bien fait, merci'
          redirect_to "/activity_places"
        else
          render :edit
        end
      end
    
      def destroy
        @activity_place = ActivityPlace.find(params[:id])
        @activity_place.destroy
        redirect_to activity_places_path
      end



    private

    def activity_place_params
        params.require(:activity_place).permit(:Name, :Address)
    end

end
