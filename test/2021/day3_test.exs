defmodule Day3Test do
  use ExUnit.Case
  doctest AoC2021.Day3

  test "test input" do
    assert AoC2021.Day3.calculatePowerConsumption(Path.expand("./test/2021/resources/day3_test_input")) == 198
  end

  test "real input" do
    assert AoC2021.Day3.calculatePowerConsumption(Path.expand("./test/2021/resources/day3_real_input")) == 3309596
  end

  test "test input to verify LifeSupportRating" do
    assert AoC2021.Day3.verifyLifeSupportRating(Path.expand("./test/2021/resources/day3_test_input")) == 230
  end

  test "real input to verify LifeSupportRating" do
    assert AoC2021.Day3.verifyLifeSupportRating(Path.expand("./test/2021/resources/day3_real_input")) == 2981085
  end
end
