defmodule AoC2021.Day5 do
  def filterDiagonals(coordinates) do
    Enum.filter(coordinates, fn([{x1,y1}, {x2,y2}]) -> x1 == x2 || y1 == y2 end) 
  end

  def parseCoordinates(input) do
    Enum.map(input, fn(line) -> 
      String.split(line, " -> ", trim: true) 
        |> Enum.map(fn(set) -> String.split(set, ",") 
          |> Enum.map(&String.to_integer/1) |> List.to_tuple
      end)
    end)
  end

  def findHydroThermalDangerPoints(inputPath) do
    AoC2021.readFileAsListLineByLine(inputPath)
      |> parseCoordinates
      |> filterDiagonals
      |> Enum.flat_map(&drawLine/1)
      |> Enum.frequencies
      |> Enum.filter(fn({key, val}) -> val > 1 end)
      |> Enum.count
  end

  def compare(val1, val2) do
    cond do
      val1 < val2 -> 1
      val1 > val2 -> -1
      val1 == val2 -> 0
    end
  end

  def drawLine([{x1, y1}, {x2, y2}]) do
    lineLength = [abs(x1-x2), abs(y1-y2)] |> Enum.max
    xDelta = compare(x1, x2)
    yDelta = compare(y1, y2)
    Enum.map(0..lineLength, fn(pos) -> 
      {x1 + (pos * xDelta), y1 + (pos * yDelta)} 
    end)
  end
end
