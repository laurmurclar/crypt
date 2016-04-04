class Edoc < ActiveRecord::Base
  belongs_to :group
  validates :name, presence: true
  mount_uploader :doc, DocUploader
end
