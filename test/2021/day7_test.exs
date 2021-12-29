defmodule Day7Test do
  use ExUnit.Case
  doctest AoC2021.Day7

  test "test input - cheapest fuel alignment with constant fuel rate" do
    assert AoC2021.Day7.getCheapestFuelAlignment(Path.expand("./test/2021/resources/day7_test_input"), false) == 37
  end

  test "real input - cheapest fuel alignment with constant fuel rate" do
    assert AoC2021.Day7.getCheapestFuelAlignment(Path.expand("./test/2021/resources/day7_real_input"), false) == 336120
  end

  test "test input - cheapest fuel alignment with increasing fuel rate" do
    assert AoC2021.Day7.getCheapestFuelAlignment(Path.expand("./test/2021/resources/day7_test_input"), true) == 168
  end

  test "real input - cheapest fuel alignment with increasing fuel rate" do
    assert AoC2021.Day7.getCheapestFuelAlignment(Path.expand("./test/2021/resources/day7_real_input"), true) == 96864235
  end
end
