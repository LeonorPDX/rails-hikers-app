class TripReportsController < ApplicationController
    def create
        tr = TripReport.new
        tr.user = current_user
        tr.trip_report_date = Date.today
        tr.hike_id = params[:hike_id]
        tr.rating = params[:rating]
        tr.content = params[:content]
        
        if tr.save
            redirect_to hike_path(tr.hike)
        else
            tr.errors.full_messages.each {|msg| flash.notice = msg }
            redirect_to hike_path(tr.hike)
        end
    end
end
