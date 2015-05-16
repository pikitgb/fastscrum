class AddTecnicalDocumentToProject < ActiveRecord::Migration
  def change
    add_column :projects, :tecnical_document, :text
  end
end
