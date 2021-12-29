defmodule AoC2020.Day2 do
  def count_valid_passwords input, policy do
    parse_input(input)
      |> Enum.filter(&(password_valid?(policy, &1)))
      |> Enum.count
  end

  def password_valid? :sled_rental_policy, %{"min" => min, "max" => max, "character" => character, "password" => password} do
    String.replace(password, ~r/[^#{character}]/, "")
      |> String.length
      |> (&(&1 >= min and &1 <= max)).()
  end

  def password_valid? :tobbogan_policy, %{"min" => min, "max" => max, "character" => character, "password" => password} do
    [String.at(password, min - 1), String.at(password, max - 1)]
      |> Enum.filter(&(&1 == character))
      |> Enum.count
      |> (&(&1 == 1)).()
  end

  def parse_input input do
    input
      |> Enum.map(&(Regex.named_captures(~r/(?<min>\d+)-(?<max>\d+)\s(?<character>\w):\s(?<password>\w+)/, &1)))
      |> Enum.map(&parse_map_values_to_integer/1)
  end

  defp parse_map_values_to_integer map do
    map
      |> Map.put("min", String.to_integer(Map.fetch!(map, "min")))
      |> Map.put("max", String.to_integer(Map.fetch!(map, "max")))
  end
end
