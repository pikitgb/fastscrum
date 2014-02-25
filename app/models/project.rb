class Project < ActiveRecord::Base
  validates_presence_of :name
  has_many :histories, dependent: :destroy


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
