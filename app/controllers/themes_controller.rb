class ThemesController < ApplicationController

    def index 
        @themes = Theme.all
      end
  
      def new
          @theme = Theme.new
      end
  
      def create
          @theme = Theme.new(theme_params)
          if @theme.save
              redirect_to "/themes"
          else
              render :new
          end
      end
  
      def edit
          @theme = Theme.find(params[:id])
      end
  
      def update
        @theme = Theme.find(params[:id])
        if @theme.update(theme_params)
        flash[:notice] = 'Bien fait, merci'
        redirect_to "/themes"
        else
        render :edit
        end
      end
      
        def destroy
          @theme = Theme.find(params[:id])
          @theme.destroy
          redirect_to themes_path
        end
  
  
      private
  
      def theme_params
          params.require(:theme).permit(:nom, :description)
      end
      

end
