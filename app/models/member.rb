class Member < ActiveRecord::Base
  belongs_to :group
  belongs_to :user

  validates :role, inclusion: { in: %w(owner contributor) }
end
