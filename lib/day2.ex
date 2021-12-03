defmodule AoC2021.Day2 do
  def calculatePositionAtEndOfPlottedCourse(inputPath) do
    AoC2021.readFileAsListLineByLine(inputPath)
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

  def calculatePositionAtEndOfPlottedCourseWithAim(inputPath) do
    AoC2021.readFileAsListLineByLine(inputPath)
    # using a list
      |> Enum.reduce({0, 0, 0}, fn(plot), {horizontalPosition, depth, aim} ->
        [command, valueString] = String.split(plot)
        value = String.to_integer(valueString)
        cond do
          command == "forward" -> { horizontalPosition + value, depth + (aim * value), aim }
          command == "down" -> { horizontalPosition, depth, aim + value }
          command == "up" -> { horizontalPosition, depth, aim - value }
        end
      end)
      |> Tuple.to_list
      |> Enum.slice(0..1)
      |> Enum.product()
  end
end
