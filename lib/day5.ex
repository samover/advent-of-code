defmodule AoC2021.Day5 do
  def findHydroThermalDangerPoints(inputPath) do
    coordinates = AoC2021.readFileAsListLineByLine(inputPath)
      |> Enum.map(fn(line) -> String.replace(line, " -> ", ",") end)
      |> Enum.map(fn(line) -> String.split(line, ",", trim: true) end)
      |> Enum.map(fn(list) -> Enum.map(list, &String.to_integer/1) end)

    [x,y] = findMaxCoordinates(coordinates)

    matrix = List.duplicate(0, (x + 1) * (y + 1))

    # only consider horizontal or vertical lines
    Enum.reduce(coordinates, matrix, fn(coordinateSet, updatedMatrix) -> 
      IO.inspect(coordinateSet, label: "coordinateSet")
      [xStart, xEnd] = Enum.take_every(coordinateSet, 2)
      [yStart, yEnd] = Enum.take_every(Enum.slice(coordinateSet, 1..-1), 2)
      if (xStart != xEnd && yStart != yEnd) do
        updatedMatrix
      else
        Enum.reduce(yStart..yEnd, updatedMatrix, fn(yCoord, updatedMatrix2) -> 
          Enum.reduce(xStart..xEnd, updatedMatrix2, fn(xCoord, updatedMatrix2) ->
            position = (yCoord * (x + 1)) + xCoord
            List.replace_at(updatedMatrix2, position, Enum.at(updatedMatrix2, position) + 1)
          end)
        end)
      end
    end)
      |> Enum.filter(fn(pnt) -> pnt > 1 end)
      |> Enum.count
  end

  def buildEmptyMatrix(x, y) do
    Enum.map(0..y, fn(_) -> List.duplicate(0, x + 1) end)
  end

  def findMaxCoordinates(coordinates) do
    x = Enum.reduce(coordinates, 0, fn(coordinateSet, maxCoordinate) ->
          maxValue = findMaxValue(coordinateSet, 0, 2)
          if maxValue > maxCoordinate, do: maxValue, else: maxCoordinate
    end)
    y = Enum.reduce(coordinates, 0, fn(coordinateSet, maxCoordinate) ->
          maxValue = findMaxValue(coordinateSet, 1, 1)
          if maxValue > maxCoordinate, do: maxValue, else: maxCoordinate
    end)
    [x,y]
  end

  # [0,9,5,9]
  def findMaxValue(list, start, step) do
    list 
      |> Enum.slice(start..-1)
      |> Enum.take_every(step)
      |> Enum.max
  end
end
