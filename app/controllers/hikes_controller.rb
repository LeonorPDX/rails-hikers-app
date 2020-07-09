class HikesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_hike, except: [:index, :new, :create]

    def index
      if params[:filter]
        case params[:filter]
        when 'Wildflowers'
          @hikes = Hike.wildflowers
        when 'Beaches'
          @hikes = Hike.beaches
        when 'Mountains'
          @hikes = Hike.mountains
        when 'Waterfalls'
          @hikes = Hike.waterfalls
        when 'Family-friendly'
          @hikes = Hike.family_friendly
        when 'Dog-friendly'
          @hikes = Hike.dog_friendly
        end
      else
        @hikes = Hike.all.sort_by{ |h| h.name }
      end
    end

    def show
        @trailhead = @hike.trailhead
        @trip_reports = @hike.trip_reports.reverse
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
        @hike.user_id = current_user.id

        if @hike.valid?
            @hike.save
            redirect_to hike_path(@hike)
        else
            flash[:errors] = @hike.errors.full_messages
            render :new
        end
    end

    def edit
        if params[:trailhead_id]
          th = Trailhead.find_by(id: params[:trailhead_id])
          if th.nil?
            redirect_to trailheads_path, alert: "Trailhead not found."
          else
            @hike = th.hikes.find_by(id: params[:id])
            redirect_to trailhead_hikes_path(th), alert: "Hike not found." if @hike.nil?
          end
        end
    end
    
    def update
        @hike.update(hike_params)
    
        if @hike.save
          redirect_to @hike
        else
          flash[:errors] = @hike.errors.full_messages
          render :edit
        end
    end

    def destroy
      @hike.destroy
      redirect_to hikes_path
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
                                        :trailhead_id)
    end

end
