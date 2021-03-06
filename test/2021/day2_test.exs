defmodule Day2Test do
  use ExUnit.Case
  doctest AoC2021.Day2

  test "test input" do
    assert AoC2021.Day2.calculatePositionAtEndOfPlottedCourse(Path.expand("./test/2021/resources/day2_test_input")) == 150
  end

  test "real input" do
    assert AoC2021.Day2.calculatePositionAtEndOfPlottedCourse(Path.expand("./test/2021/resources/day2_real_input")) == 1451208
  end

  test "test input with aim" do
    assert AoC2021.Day2.calculatePositionAtEndOfPlottedCourseWithAim(Path.expand("./test/2021/resources/day2_test_input")) == 900
  end

  test "real input with aim" do
    assert AoC2021.Day2.calculatePositionAtEndOfPlottedCourseWithAim(Path.expand("./test/2021/resources/day2_real_input")) == 1620141160
  end
end
