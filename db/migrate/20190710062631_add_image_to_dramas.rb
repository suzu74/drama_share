class AddImageToDramas < ActiveRecord::Migration[5.2]
  def change
    add_column :dramas, :image, :text
  end
end
