require 'test_helper'

class GroupTest < ActiveSupport::TestCase

  def setup
    @group = groups(:one)
  end

  test "group should be valid" do
    assert @group.valid?
  end

end
