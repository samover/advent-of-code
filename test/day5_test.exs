defmodule Day5Test do
  use ExUnit.Case
  doctest AoC2021.Day5

  # test "test input - winning board" do
  #   assert AoC2021.Day5.findHydroThermalDangerPoints(Path.expand("./test/resources/day5_test_input")) == 5
  # end

  @tag timeout: :infinity
  test "test real input - winning board" do
    assert AoC2021.Day5.findHydroThermalDangerPoints(Path.expand("./test/resources/day5_real_input")) == 71708
  end

  # describe "findMaxValue/2" do
  #   test "takes a list and returns highest value over 1th item" do
  #     assert AoC2021.Day5.findMaxValue([0,7,5,9], 1, 2) == 9
  #   end
  #   test "takes a list and returns highest value over 2nd item" do
  #     assert AoC2021.Day5.findMaxValue([0,7,5,9], 0, 2) == 5
  #   end
  #   test "takes a list and returns highest value" do
  #     assert AoC2021.Day5.findMaxValue([0,7,10,9], 0, 1) == 10
  #   end
  # end
end
