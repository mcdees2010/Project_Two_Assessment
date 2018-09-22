class WidgetsController < ApplicationController

    def index
        @widgets = Widget.all
        @widget = Widget.new
    end

    def create
        @widget = Widget.new(widget_params)

        if @widget.save
            redirect_to root_path(@widget)
        else
            redirect_to 'index'
        end
    end

    def destroy
        @widget = Widget.find params[:id]

        @widget.destroy
        redirect_to root_path
    end

    private
    
        def widget_params 
            params.require(:widget).permit(:description, :quantity)
        end
end