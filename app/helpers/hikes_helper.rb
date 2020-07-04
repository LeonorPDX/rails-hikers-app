module HikesHelper
    def trailhead_id_field(hike)
        if hike.trailhead.nil?
          select_tag "hike[trailhead_id]", options_from_collection_for_select(Trailhead.all, :id, :name)
        else
          hidden_field_tag "hike[trailhead_id]", hike.trailhead_id
        end
    end
end
