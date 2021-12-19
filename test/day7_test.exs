defmodule Day7Test do
  use ExUnit.Case
  doctest AoC2021.Day7

  test "test input - simulate spawning after 18 day" do
    assert AoC2021.Day7.getCheapestFuelAlignment(Path.expand("./test/resources/day7_test_input")) == 37
  end

  @tag timeout: :infinity
  test "real input - simulate spawning after 18 day" do
    assert AoC2021.Day7.getCheapestFuelAlignment(Path.expand("./test/resources/day7_real_input")) == 336120
  end

  # test "test input - simulate spawning after 80 days" do
  #   assert AoC2021.Day7.lanternFishSpawningPredictor(Path.expand("./test/resources/day6_test_input"), 80) == 5934 
  # end
  
  # test "test input - simulate spawning after 256 days" do
  #   assert AoC2021.Day7.lanternFishSpawningPredictor(Path.expand("./test/resources/day6_test_input"), 256) == 26984457539 
  # end

  # test "real input - simulate spawning after 80 days" do
  #   assert AoC2021.Day7.lanternFishSpawningPredictor(Path.expand("./test/resources/day6_real_input"), 80) == 359344 
  # end

  # test "real input - simulate spawning after 256 days" do
  #   assert AoC2021.Day7.lanternFishSpawningPredictor(Path.expand("./test/resources/day6_real_input"), 256) == 1629570219571 
  # end
end
