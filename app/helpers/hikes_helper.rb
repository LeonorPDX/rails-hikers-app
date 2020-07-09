module HikesHelper

  def boolean_display(hike)
    display_text = nil
    arr = []

    if hike.waterfalls == true
        arr << "Waterfalls"
    end

    if hike.wildflowers == true
        arr << "Wildflowers"
    end

    if hike.mountains == true
        arr << "Mountains"
    end

    if hike.beaches == true
        arr << "Beaches"
    end

    if hike.family_friendly == true
        arr << "Family-friendly"
    end

    if hike.dog_friendly == true
        arr << "Dog-friendly"
    end

    unless arr.empty?
        display_text = arr.join(", ")
    end

    display_text
  end
  
end
