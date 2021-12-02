defmodule Day2 do
  def calculatePositionAtEndOfPlottedCourse(inputPath) do
    fileToIntegerList(inputPath)
      |> Enum.map(fn(plot) ->
        [command, value] = String.split(plot)
        case command do
          "forward" -> {String.to_integer(value), 0}
          "down" -> {0, String.to_integer(value)}
          "up" -> {0, -String.to_integer(value)}
        end
      end)
      |> Enum.unzip
      |> Tuple.to_list
      |> Enum.reduce(1, fn(list, acc) ->
        acc * Enum.sum(list)
      end)
  end

  def calculatePositionAtEndOfPlottedCourseWithAim(inputPath) do
    fileToIntegerList(inputPath)
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

  defp fileToIntegerList(inputPath) do
    {:ok, file} = File.read(inputPath)
    file |> String.split("\n")
  end
end
