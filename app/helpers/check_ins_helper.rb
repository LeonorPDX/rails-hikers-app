module CheckInsHelper
    def format_ch_date(check_in)
        check_in.check_in_date.strftime("%B %d, %Y")
    end
end
