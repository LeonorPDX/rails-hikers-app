module TripReportsHelper
    def format_tr_date(tr)
        tr.trip_report_date.strftime("%B %d, %Y")
    end
end
