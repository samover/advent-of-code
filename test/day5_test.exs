defmodule Day5Test do
  use ExUnit.Case
  doctest AoC2021.Day5

  test "test input - winning board" do
    assert AoC2021.Day5.findHydroThermalDangerPoints(Path.expand("./test/resources/day5_test_input")) == 5
  end

  @tag timeout: :infinity
  test "test real input - winning board" do
    assert AoC2021.Day5.findHydroThermalDangerPoints(Path.expand("./test/resources/day5_real_input")) == 5084
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
