class AddAttachmentReferenceDocumentToProjects < ActiveRecord::Migration
  def self.up
    change_table :projects do |t|
      t.attachment :reference_document
    end
  end

  def self.down
    drop_attached_file :projects, :reference_document
  end
end
