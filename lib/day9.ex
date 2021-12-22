defmodule AoC2021. Day9 do
  def get_height_map_risk_level(input_path) do
    {line_length, height_map} = parse_input(input_path)
      find_low_point({line_length, height_map})
      |> Enum.map(&(elem(&1, 0) + 1))
      |> Enum.sum
  end

  def find_three_largest_bassins(input_path) do
    {line_length, height_map} = parse_input(input_path)
    find_low_point({line_length, height_map})
      |> Enum.map(&(map_bassin(line_length, height_map, [&1])))
      |> Enum.sort(&(Enum.count(&1) >= Enum.count(&2)))
      |> Enum.slice(0..2)
      |> Enum.map(&Enum.count/1)
      |> Enum.product
  end

  # needs refactoring. not readable and not very elegant
  def map_bassin(line_length, height_map, unexplored_bassin, explored_bassin \\ []) do
    map = Enum.flat_map(unexplored_bassin, fn({_,x}) ->
      Enum.map(adjacent_locations(x, line_length), &({Enum.at(height_map, &1), &1}))
        |> Enum.filter(fn({val, _}) -> val < 9 && !is_nil(val) end)
    end)
      |> Enum.uniq

    if Enum.count(map -- explored_bassin -- unexplored_bassin) > 0 do
      map_bassin(line_length, height_map, map -- explored_bassin -- unexplored_bassin, Enum.concat(explored_bassin, unexplored_bassin))
    else
      explored_bassin ++ unexplored_bassin |> Enum.uniq
    end
  end

  def find_low_point({line_length, lines}) do
    Enum.with_index(lines)
      |> Enum.filter(fn({x, i}) -> low_point?(x, i, {line_length, lines}) end)
  end

  defp low_point?(height, pos, {line_length, height_map}) do
    Enum.map(adjacent_locations(pos, line_length), &(Enum.at(height_map, &1)))
      |> Enum.all?(&(&1 > height))
  end

  defp adjacent_locations(pos, l) do
    Enum.filter([up(l, pos), down(l, pos), right(l, pos), left(l, pos)], &(!is_nil(&1)))
  end

  defp parse_input(path) do
    input = AoC2021.readFileAsListLineByLine(path)
    line_length = String.length(Enum.at(input, 0))
    lines = input
      |> Enum.flat_map(&String.split(&1, "", trim: true))
      |> Enum.map(&String.to_integer/1)
    {line_length, lines}
  end

  defp up(l, x) when x < l do nil end
  defp up(l, x) do x - l end
  defp down(l, x) do x + l end
  defp right(l, x) do (if rem(x + 1, l) == 0, do: nil, else: x + 1) end
  defp left(_, x) when x - 1 < 0 do nil end
  defp left(l, x) do (if rem(x, l) == 0 && x != 0, do: nil, else: x - 1) end
end
