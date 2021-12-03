defmodule AoC2021.Day3 do
  def calculatePositionAtEndOfPlottedCourse(inputPath) do
    Aoc2021.readFileAsListLineByLine(inputPath)
    # using a map
      |> Enum.reduce(%{x: 0, y: 0}, fn(plot), %{x: horizontalPosition, y: depth} ->
        [command, valueString] = String.split(plot)
        value = String.to_integer(valueString)
        cond do
          command == "forward" -> %{ x: horizontalPosition + value, y: depth }
          command == "down" -> %{ x: horizontalPosition, y: depth + value }
          command == "up" -> %{ x: horizontalPosition, y: depth - value }
        end
      end)
      |> Map.values
      |> Enum.product
  end
end
