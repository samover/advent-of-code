defmodule Day11Test do
  use ExUnit.Case
  doctest AoC2021.Day11

  setup_all [:read_test_input, :read_real_input]
  defp read_test_input(_context) do
    [test_input: ReadInput.line_list(Path.expand("./test/2021/resources/day11_test_input"))]
  end
  defp read_real_input(_context) do
    [real_input: ReadInput.line_list(Path.expand("./test/2021/resources/day11_real_input"))]
  end

  # test "test input: count total flashes after a 100 steps", %{test_input: input} do
  #   assert AoC2021.Day11.count_total_flashes(input, 2) == 1656
  # end
end
