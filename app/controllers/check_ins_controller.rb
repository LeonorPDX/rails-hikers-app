class CheckInsController < ApplicationController
    def create
        ch = CheckIn.new
        ch.user = current_user
        ch.check_in_date = Date.today
        ch.trailhead_id = params[:trailhead_id]
        
        if ch.save
            redirect_to trailhead_path(ch.trailhead)
        else
            flash.notice = "Users can only check in once per day at a trailhead."
            redirect_to trailhead_path(ch.trailhead)
        end
    end
end
