class AddImageUrlToHikes < ActiveRecord::Migration[6.0]
  def change
    add_column :hikes, :image_url, :string
  end
end
