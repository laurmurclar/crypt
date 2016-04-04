class UserDoc < ActiveRecord::Base
  belongs_to :user
  belongs_to :edoc
end
