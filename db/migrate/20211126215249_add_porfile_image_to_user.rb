class AddPorfileImageToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :porfile_image, :text
  end
end
