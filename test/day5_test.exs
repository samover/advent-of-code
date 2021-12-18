defmodule Day5Test do
  use ExUnit.Case
  doctest AoC2021.Day5

  test "test input - find hydrothermal vents (no diagonals)" do
    assert AoC2021.Day5.findHydroThermalDangerPoints(Path.expand("./test/resources/day5_test_input"), :noDiagonals) == 5
  end

  test "real input - find hydrothermal vents (no diagonals)" do
    assert AoC2021.Day5.findHydroThermalDangerPoints(Path.expand("./test/resources/day5_real_input"), :noDiagonals) == 5084
  end

  test "test input - find hydrothermal vents (with diagonals)" do
    assert AoC2021.Day5.findHydroThermalDangerPoints(Path.expand("./test/resources/day5_test_input")) == 12
  end

  test "real input - find hydrothermal vents (with diagonals)" do
    assert AoC2021.Day5.findHydroThermalDangerPoints(Path.expand("./test/resources/day5_real_input")) == 17882
  end

  describe "drawLine" do
    test "maps out values of a horizaontal line" do
      assert AoC2021.Day5.drawLine([{0,9},{5,9}]) == [{0, 9}, {1, 9}, {2, 9}, {3, 9}, {4, 9}, {5, 9}]
    end
    test "maps out values of a horizontal line (2)" do
      assert AoC2021.Day5.drawLine([{5,9},{0,9}]) == [{5, 9}, {4, 9}, {3, 9}, {2, 9}, {1, 9}, {0, 9}]
    end
    test "maps out values of a vertical line " do
      assert AoC2021.Day5.drawLine([{9,0},{9,5}]) == [{9, 0}, {9, 1}, {9, 2}, {9, 3}, {9, 4}, {9, 5}]
    end
    test "maps out values of a vertical line (2) " do
      assert AoC2021.Day5.drawLine([{9,5},{9,0}]) == [{9, 5}, {9, 4}, {9, 3}, {9, 2}, {9, 1}, {9, 0}]
    end
  end
end
