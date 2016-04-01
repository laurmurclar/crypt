require 'test_helper'

class MemberTest < ActiveSupport::TestCase

  def setup
    @member = Member.new(group: groups(:one), user: users(:one), role: 'owner')
  end

  test "member should be valid" do
    assert @member.valid?
  end

  test "role should be owner or contributor" do
    @member.role = "invalid role"
    assert_not @member.valid?
    
    @member.role = "contributor"
    assert @member.valid?
  end

end
