defmodule Day1Test do
  use ExUnit.Case
  doctest Day1

  test "test input" do
    assert Day1.countIncreasedDepth(Path.expand("./test/resources/day1_test_input")) == 7
  end

  test "real input" do
    assert Day1.countIncreasedDepth(Path.expand("./test/resources/day1_real_input")) == 1121
  end

  test "test input with sliding window" do
    assert Day1.countIncreasedDepthBySlidingWindow(Path.expand("./test/resources/day1_test_input")) == 5
  end

  test "real input with sliding window" do
    assert Day1.countIncreasedDepthBySlidingWindow(Path.expand("./test/resources/day1_real_input")) == 1065
  end
end
