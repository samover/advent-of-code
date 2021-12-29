defmodule Day1Test do
  use ExUnit.Case
  doctest AoC2020.Day1

  @puzzle_day "2020/day2"
  setup_all [:read_example_input, :read_puzzle_input]

  defp read_example_input(_context) do
    [example_input: AoC2020.parse_file_to_line_list(Path.expand("./lib/#{@puzzle_day}/example_input"))]
  end
  defp read_puzzle_input(_context) do
    [puzzle_input: AoC2020.parse_file_to_line_list(Path.expand("./lib/#{@puzzle_day}/puzzle_input"))]
  end

  test "using example input: count valid passwords using sled rental policy", %{example_input: input} do
    assert AoC2020.Day2.count_valid_passwords(input, :sled_rental_policy) == 2
  end
  test "using puzzle input: count valid passwords using sled rental policy", %{puzzle_input: input} do
    assert AoC2020.Day2.count_valid_passwords(input, :sled_rental_policy) == 506
  end
  test "using example input: count valid passwords using tobbogan policy", %{example_input: input} do
    assert AoC2020.Day2.count_valid_passwords(input, :tobbogan_policy) == 1
  end
  test "using puzzle input: count valid passwords using tobbogan policy", %{puzzle_input: input} do
    assert AoC2020.Day2.count_valid_passwords(input, :tobbogan_policy) == 443
  end
end
