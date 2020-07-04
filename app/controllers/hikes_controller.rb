class HikesController < ApplicationController

    def index
        @hikes = Hike.all 
    end

    def show
        @hike = Hike.find_by(id: params[:id])
        @trailhead = @hike.trailhead
    end

    def new
        if params[:trailhead_id] && !Trailhead.exists?(params[:trailhead_id])
          redirect_to trailheads_path, alert: "Trailhead not found."
        else
          @hike = Hike.new(trailhead_id: params[:trailhead_id])
        end
    end

    def create
        @hike = Hike.new(hike_params)
        if @hike.save
            redirect_to hike_path(@hike)
        else
            redirect_to new_hike_path
        end
    end

    private

    def hike_params
        params.require(:hike).permit(   :name,
                                        :description,
                                        :difficulty,
                                        :distance,
                                        :elevation_gain,
                                        :hike_type,
                                        :waterfalls,
                                        :wildflowers,
                                        :mountains,
                                        :beaches,
                                        :dog_friendly,
                                        :family_friendly,
                                        :user_id,
                                        :trailhead_id)
    end

end
