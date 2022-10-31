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

  test "grams can be blank" do
    food = Food.new(name: "bistec de res")

    assert food.valid?
  end

  test "grams has to be an integer" do
    food = Food.new(name: "bistec de res", grams: "1 plate")

    assert food.invalid?
    assert_equal ["is not a number"], food.errors[:grams]

    food = Food.new(name: "bistec de res", grams: "1.0")
    assert food.invalid?
    assert_equal ["must be an integer"], food.errors[:grams]
  end
end
