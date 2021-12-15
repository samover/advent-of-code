defmodule Day4Test do
  use ExUnit.Case
  doctest AoC2021.Day4

  test "test input" do
    assert AoC2021.Day4.playBingo(Path.expand("./test/resources/day4_test_input")) == 4512
  end

  test "test real input" do
    assert AoC2021.Day4.playBingo(Path.expand("./test/resources/day4_real_input")) == 71708
  end

  # test "test input to verify LifeSupportRating" do
  #   assert AoC2021.Day3.verifyLifeSupportRating(Path.expand("./test/resources/day3_test_input")) == 230
  # end

  # test "real input to verify LifeSupportRating" do
  #   assert AoC2021.Day3.verifyLifeSupportRating(Path.expand("./test/resources/day3_real_input")) == 230
  # end
end
