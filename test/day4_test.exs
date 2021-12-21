defmodule Day4Test do
  use ExUnit.Case
  doctest AoC2021.Day4

  test "test input - winning board" do
    assert AoC2021.Day4.playBingo(:getWinner, Path.expand("./test/resources/day4_test_input")) == 4512
  end

  test "test real input - winning board" do
    assert AoC2021.Day4.playBingo(:getWinner, Path.expand("./test/resources/day4_real_input")) == 71708
  end

  test "test input - losing board" do
    assert AoC2021.Day4.playBingo(:getLoser, Path.expand("./test/resources/day4_test_input")) == 1924
  end

  test "test real input - losing board" do
    assert AoC2021.Day4.playBingo(:getLoser, Path.expand("./test/resources/day4_real_input")) == 34726
  end
end
