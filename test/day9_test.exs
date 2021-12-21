defmodule Day9Test do
  use ExUnit.Case
  doctest AoC2021.Day9

  test "test input -sum of the risk levels of all low points on your heightmap " do
    assert AoC2021.Day9.get_height_map_risk_level(Path.expand("./test/resources/day9_test_input")) == 15
  end
  test "real input -sum of the risk levels of all low points on your heightmap " do
    assert AoC2021.Day9.get_height_map_risk_level(Path.expand("./test/resources/day9_real_input")) == 494
  end
  test "test input - find three largest bassins and multiply their sizes together" do
    assert AoC2021.Day9.find_three_largest_bassins(Path.expand("./test/resources/day9_test_input")) == 1134
  end
  test "real input - find three largest bassins and multiply their sizes together" do
    assert AoC2021.Day9.find_three_largest_bassins(Path.expand("./test/resources/day9_real_input")) == 1048128
  end
end
