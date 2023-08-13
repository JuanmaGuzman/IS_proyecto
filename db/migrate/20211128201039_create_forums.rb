class CreateForums < ActiveRecord::Migration[6.1]
  def change
    create_table :forums do |t|
      t.datetime :date
      t.text :content
      t.string :user_name
      t.bigint :user_id
      t.bigint :lesson_id

      t.timestamps
    end
  end
end
