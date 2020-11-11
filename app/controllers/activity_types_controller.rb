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

    def edit
        @activity_type = ActivityType.find(params[:id])
    end

    def update
        @activity_type = ActivityType.find(params[:id])
        if @activity_type.update(activity_type_params)
          flash[:notice] = 'Bien fait, merci'
          redirect_to "/activity_types"
        else
          render :edit
        end
      end
    
      def destroy
        @activity_type = ActivityType.find(params[:id])
        @activity_type.destroy
        redirect_to activity_types_path
      end


    private

    def activity_type_params
        params.require(:activity_type).permit(:title)
    end
    

end
