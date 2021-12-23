defmodule Day10Test do
  use ExUnit.Case
  doctest AoC2021.Day10

  setup_all [:read_test_input, :read_real_input]
  defp read_test_input(_context) do
    [test_input: ReadInput.line_list(Path.expand("./test/resources/day10_test_input"))]
  end
  defp read_real_input(_context) do
    [real_input: ReadInput.line_list(Path.expand("./test/resources/day10_real_input"))]
  end

  test "test input -sum of the risk levels of all low points on your heightmap", %{test_input: input} do
    assert AoC2021.Day10.check_syntax(input) == 26_397
  end
  test "real input -sum of the risk levels of all low points on your heightmap", %{real_input: input} do
    assert AoC2021.Day10.check_syntax(input) == 344_193
  end
  test "test input - autocomplete", %{test_input: input} do
    assert AoC2021.Day10.complete_uncorrupted_lines(input) == 288_957
  end
  test "real input - autocomplete", %{real_input: input} do
    assert AoC2021.Day10.complete_uncorrupted_lines(input) == 3_241_238_967
  end
end
