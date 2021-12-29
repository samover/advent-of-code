defmodule Day1Test do
  use ExUnit.Case
  doctest AoC2020.Day1

  @puzzle_day "2020/day1"
  setup_all [:read_example_input, :read_puzzle_input]

  defp read_example_input(_context) do
    [example_input: AoC2020.parse_file_to_line_list(Path.expand("./lib/#{@puzzle_day}/example_input"))]
  end
  defp read_puzzle_input(_context) do
    [puzzle_input: AoC2020.parse_file_to_line_list(Path.expand("./lib/#{@puzzle_day}/puzzle_input"))]
  end

  test "using example input: fix expense report (two entries)", %{example_input: input} do
    assert AoC2020.Day1.fix_expense_report(input, :two) == 514_579
  end

  test "using puzzle input: fix expense report (two entries)", %{puzzle_input: input} do
    assert AoC2020.Day1.fix_expense_report(input, :two) == 299_299
  end

  test "using example input: fix expense report (three entries)", %{example_input: input} do
    assert AoC2020.Day1.fix_expense_report(input, :three) == 241_861_950
  end
  test "using puzzle input: fix expense report (three entries)", %{puzzle_input: input} do
    assert AoC2020.Day1.fix_expense_report(input, :three) == 287_730_716
  end
end
