require "test_helper"

class FoodTest < ActiveSupport::TestCase
  test "name is not blank" do
    food = Food.create

    assert food.invalid?
    assert_equal ["can't be blank"], food.errors[:name]
  end

  test "name is unique" do
    food = Food.new(name: "Yo Pro Danone")

    assert food.invalid?
    assert_equal ["has already been taken"], food.errors[:name]
  end

  test "name is unique and case insensitive" do
    food = Food.new(name: "filete de pescado")

    assert food.invalid?
    assert_equal ["has already been taken"], food.errors[:name]
  end
end
