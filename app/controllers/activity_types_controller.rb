class ActivityTypesController < ApplicationController

    def index 
      @activity_types = ActivityType.all
    end

    def new
        @activity_type = ActivityType.new
    end

    def create
        @activity_type = ActivityType.new(activity_type_params)
        if @activity_type.save
            redirect_to "/activity_types"
        else
            render :new
        end
    end

    private

    def activity_type_params
        params.require(:activity_type).permit(:title)
    end
    

end
