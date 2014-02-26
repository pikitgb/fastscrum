class AddAttachmentSpecificationDocumentToProjects < ActiveRecord::Migration
  def self.up
    change_table :projects do |t|
      t.attachment :specification_document
    end
  end

  def self.down
    drop_attached_file :projects, :specification_document
  end
end
