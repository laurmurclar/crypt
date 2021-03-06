class Group < ActiveRecord::Base
  has_many :members
  has_many :users, through: :members, dependent: :destroy
  has_many :edocs

  validates :name, presence: true

  def owner
    self.members.where(role: 'owner').first
  end
end
