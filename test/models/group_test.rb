require "test_helper"

class GroupTest < ActiveSupport::TestCase
  test "name is not blank" do
    group = Group.new

    assert group.invalid?
    assert_equal ["can't be blank"], group.errors[:name]
  end

  test "name is unique" do
    group = Group.new(name: "Fruits")

    assert group.invalid?
    assert_equal ["has already been taken"], group.errors[:name]
  end

  test "name is unique and case insensitive" do
    group = Group.new(name: "fruits")

    assert group.invalid?
    assert_equal ["has already been taken"], group.errors[:name]
  end
end
