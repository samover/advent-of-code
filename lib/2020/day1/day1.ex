defmodule AoC2020.Day1 do
  def fix_expense_report input, entries do
    parse_input(input)
      |> find_2020_sum(entries)
      |> Enum.product
  end

  def find_2020_sum [h|t], entries do
    compl = Enum.find_value(t, fn(i) -> sum_finder(h, i, t, entries) end)
    if is_nil(compl), do: find_2020_sum(t, entries), else: compl
  end

  def sum_finder(a, b, _, :two) do if a + b == 2020, do: [a, b], else: nil end
  def sum_finder(a, b, rest, :three) do
    Enum.find(Enum.reject(rest, fn(c) -> b == c end), fn(c) -> a + b + c == 2020 end)
      |> return_compl(a, b)
  end

  def return_compl(nil, _, _) do nil end
  def return_compl(x, a, b) do [a, b, x] end

  def parse_input input do
    input
      |> Enum.map(&String.to_integer/1)
  end
end
