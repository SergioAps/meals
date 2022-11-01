require "test_helper"

class MealTest < ActiveSupport::TestCase
  test "name is not blank" do
    meal = Meal.new

    assert meal.invalid?
    assert_equal ["can't be blank"], meal.errors[:name]
  end

  test "name is unique" do
    meal = Meal.new(name: "Breakfast")

    assert meal.invalid?
    assert_equal ["has already been taken"], meal.errors[:name]
  end

  test "name is unique and case insensitive" do
    meal = Meal.new(name: "breakfast")

    assert meal.invalid?
    assert_equal ["has already been taken"], meal.errors[:name]
  end
end
