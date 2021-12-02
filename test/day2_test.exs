defmodule Day2Test do
  use ExUnit.Case
  doctest Day2

  test "test input" do
    assert Day2.calculatePositionAtEndOfPlottedCourse(Path.expand("./test/resources/day2_test_input")) == 150
  end

  test "real input" do
    assert Day2.calculatePositionAtEndOfPlottedCourse(Path.expand("./test/resources/day2_real_input")) == 1451208
  end
end
