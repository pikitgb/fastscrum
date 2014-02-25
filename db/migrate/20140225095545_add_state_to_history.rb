class AddStateToHistory < ActiveRecord::Migration
  def change
    add_column :histories, :state, :string, default: "pending"
  end
end
