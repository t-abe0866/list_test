class ControlDevicesController < ApplicationController
    
    helper_method :sort_column, :sort_direction

    def index
        if params[:sort_item]
            @sort_item = params[:sort_item]
        else
            @sort_item = "control_device_id"
        end

        if params[:sort_order]
            @sort_order = params[:sort_order]
        else
            @sort_order = "asc"
        end

        if params[:display_result]
            @display_result = params[:display_result]
        else
            @display_result = 10
        end

        if params[:search]
            @control_devices = ControlDevice.order("#{sort_column} #{sort_direction}")
                                .where('cast(control_device_id as text) LIKE ? OR name LIKE ? OR physical_code LIKE ? OR cast(memo as text) LIKE ?', 
                                "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%").page(params[:page]).per(@display_result)
        else
            @control_devices = ControlDevice.order("#{sort_column} #{sort_direction}").page(params[:page]).per(@display_result)
        end
    end

    private

    # Strong Parameter
    def control_device_params
      params.require(:control_device).permit(:control_device_id,:name,:physical_code,:memo)
    end

    def sort_direction
        %w[asc desc].include?(params[:sort_item]) ? params[:sort_item] : @sort_order
    end
       
    def sort_column
        ControlDevice.column_names.include?(params[:sort]) ? params[:sort] : @sort_item
    end
end
