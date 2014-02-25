class CreateHistories < ActiveRecord::Migration
  def change
    create_table :histories do |t|
      t.string :name
      t.integer :puntuation
      t.text :finished_definition
      t.text :comments

      t.timestamps
    end
  end
end
