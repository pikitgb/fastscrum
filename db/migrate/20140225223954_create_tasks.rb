class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :description
      t.text :comments
      t.integer :history_id

      t.timestamps
    end
  end
end
