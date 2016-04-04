class Edoc < ActiveRecord::Base
  belongs_to :group
  has_many :user_docs
  
  validates :name, presence: true
  mount_uploader :doc, DocUploader
end
