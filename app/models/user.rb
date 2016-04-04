class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :validatable

  has_many :members
  has_many :groups, through: :members, dependent: :destroy
  has_many :user_docs
  
  mount_uploader :key, KeyUploader

end
