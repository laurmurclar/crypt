class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :validatable

  has_many :members
  has_many :groups, through: :members, dependent: :destroy

end
