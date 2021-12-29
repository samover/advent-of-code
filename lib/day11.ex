defmodule AoC2021.Day11 do
  def count_total_flashes(input, steps) do
    parse_input(input)
      |> execute_steps(steps)
  end

  defp execute_steps(input, 0), do: input
  defp execute_steps(input, steps) do
    IO.inspect(steps)
    step_output = Enum.map(input, &(&1+1)) |> flash_octopuses
    pretty_print(step_output, steps)
    execute_steps(step_output, steps-1)
  end

  defp pretty_print(input, steps) do
    # {:ok, file} = File.open("output_day11", [:append])
    # content = Enum.chunk_every(input, 10) |> Enum.map(&Enum.join/1) |> Enum.join("\n")
    # header = "************ STEP #{steps} ****************\n"
    # footer = "\n*******************************************\n\n"

    # IO.binwrite(file, "#{header}#{content}#{footer}")
    # File.close(file)
    # IO.inspect(Enum.chunk_every(input, 10), label: "STEP #{steps}")
  end

  defp flash_octopuses(grid) do
    IO.inspect(grid, label: "updaed grid")
    updated_grid = grid
      |> Enum.with_index
      |> Enum.reduce(List.to_tuple(grid), fn({val, i}, acc) ->
        if val>9, do: update_adjacent_cells(i, acc), else: acc
      end)
      |> Tuple.to_list
    IO.inspect(updated_grid, label: "AFTER")
    if Enum.any?(updated_grid, &(&1>9)), do: flash_octopuses(updated_grid), else: updated_grid
  end

  defp update_adjacent_cells(x, flat_grid) do
    Enum.reduce([x-9, x-10, x-11, x-1, x+1, x+9, x+10, x+11], put_elem(flat_grid, x, 0), fn(pos, acc) ->
      try do
        val = elem(acc, pos)
        put_elem(acc, pos, val+1)
      rescue
        ArgumentError -> acc
      end
    end)
  end

  defp parse_input(input) do
    Enum.flat_map(input, &String.split(&1, "", trim: true))
      |> Enum.map(&String.to_integer/1)
  end
end
