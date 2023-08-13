class AddCourseIdToReview < ActiveRecord::Migration[6.1]
  def change
    add_column :reviews, :course_id, :bigint
  end
end
