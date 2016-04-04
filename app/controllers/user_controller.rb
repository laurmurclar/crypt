class UserController < ApplicationController
  before_action :authenticate_user!

  def home
    @user = current_user
    @key = File.read(current_user.key.path)
  end

end
