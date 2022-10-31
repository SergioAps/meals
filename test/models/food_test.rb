require "test_helper"

class FoodTest < ActiveSupport::TestCase
  test "name is not blank" do
    food = Food.create

    assert food.invalid?
    assert_equal ["can't be blank"], food.errors[:name]
  end
end
