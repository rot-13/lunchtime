class Survey < ActiveRecord::Base
  belongs_to :user
  belongs_to :lunch
  attr_accessible :status

  enum :status, [:skipped, :completed]
end