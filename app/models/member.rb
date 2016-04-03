class Member < ActiveRecord::Base
  belongs_to :group
  validates_presence_of :group
  belongs_to :user
  validates_presence_of :user

  validates :role, inclusion: { in: %w(owner contributor) }
end
