class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :title
      t.text :description
      t.string :author_id
      t.references :category
      # t.references :user
      t.timestamps
    end
  end
end
