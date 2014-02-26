class Project < ActiveRecord::Base
  validates_presence_of :name
  has_many :histories, dependent: :destroy

  # attachments
  # Avatar
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  # Reference document
  has_attached_file :reference_document, :default_url => "/images/:style/missing.doc"

  # Specification document
  has_attached_file :specification_document, :default_url => "/images/:style/missing.doc"


  # Getting histories from this project
  def histories_pending
    histories.where(state: "pending")
  end

  def histories_current
    histories.where(state: "current")
  end

  def histories_finished
    histories.where(state: "finished")
  end

  def histories_canceled
    histories.where(state: "canceled")
  end

  def histories_testing
    histories.where(state: "testing")
  end
end
