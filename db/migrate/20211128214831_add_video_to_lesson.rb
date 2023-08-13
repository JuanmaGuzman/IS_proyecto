class AddVideoToLesson < ActiveRecord::Migration[6.1]
  def change
    add_column :lessons, :video, :text
  end
end
