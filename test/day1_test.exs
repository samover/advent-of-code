defmodule Day1Test do
  use ExUnit.Case
  doctest AoC2021.Day1

  test "test input" do
    assert AoC2021.Day1.countIncreasedDepth(Path.expand("./test/resources/day1_test_input"), 1) == 7
  end

  test "real input" do
    assert AoC2021.Day1.countIncreasedDepth(Path.expand("./test/resources/day1_real_input"), 1) == 1121
  end

  test "test input with sliding window" do
    assert AoC2021.Day1.countIncreasedDepth(Path.expand("./test/resources/day1_test_input"), 3) == 5
  end

  test "real input with sliding window" do
    assert AoC2021.Day1.countIncreasedDepth(Path.expand("./test/resources/day1_real_input"), 3) == 1065
  end
end
