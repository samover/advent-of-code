defmodule Day9Test do
  use ExUnit.Case
  doctest AoC2021.Day9

  test "test input -sum of the risk levels of all low points on your heightmap " do
    assert AoC2021.Day9.getHeightMapRiskLevel(Path.expand("./test/resources/day9_test_input")) == 15
  end
end
