defmodule AoC2021.Day9 do
  def getHeightMapRiskLevel(inputPath) do
    {lineLength, lines} = parseInput(inputPath)
    Enum.with_index(lines)
      |> Enum.filter(fn({x,i}) -> lowPoint?(x, i, {lineLength, lines}) end)
      # |> inspectOutput(lines, lineLength)
      |> Enum.map(&(elem(&1,0) + 1))
      |> Enum.sum
  end

  def listLowPointsWithAdjacentPoints(inputPath) do
    {lineLength, lines} = parseInput(inputPath)
    Enum.with_index(lines)
      |> Enum.filter(fn({x,i}) -> lowPoint?(x, i, {lineLength, lines}) end)
      |> Enum.map(fn {x,i} -> {x,i, Enum.map(adjacentLocations(i, lineLength), &(Enum.at(lines, &1)))} end)

  end

  def inspectOutput(lowPoints, points, lineLength) do
    IO.inspect(lineLength)
    lowPointsIndexes = Enum.map(lowPoints, &(elem(&1,1)))
    Enum.with_index(points)
      |> Enum.each(fn({x,i}) ->
        if Enum.any?(lowPointsIndexes, fn(j) -> i == j end) do
          if(i != 0 && rem(i, lineLength) == 0) do
            IO.write("\n#{IO.ANSI.red()}#{x}#{IO.ANSI.white()}")
          else
            IO.write("#{IO.ANSI.red()}#{x}#{IO.ANSI.white()}")
          end
        else
          if(i != 0 && rem(i, lineLength) == 0) do
            IO.write("\n#{x}")
          else
            IO.write("#{x}")
          end
        end
      end)
    lowPoints
  end

  defp lowPoint?(height, pos, {lineLength, heightMap}) do
    Enum.map(adjacentLocations(pos, lineLength), &(Enum.at(heightMap, &1)))
      |> Enum.all?(&(&1 > height))
  end

  # returns index
  defp adjacentLocations(pos, l) do
    Enum.filter([up(l, pos), down(l, pos), right(l, pos), left(l, pos)], &(!is_nil(&1)))
  end

  # READ FILE
  defp parseInput(path) do
    input = AoC2021.readFileAsListLineByLine(path)
    lineLength = String.length(Enum.at(input, 0))
    lines = input
      |> Enum.flat_map(&String.split(&1, "", trim: true))
      |> Enum.map(&String.to_integer/1)
    { lineLength, lines }
  end

  defp up(l, x) when x < l do nil end
  defp up(l, x) do x - l end
  defp down(l, x) do x + l end
  defp right(l, x) do (if rem(x+1, l) == 0, do: nil, else: x+1) end
  defp left(_, x) when x - 1 < 0 do nil end
  defp left(l, x) do (if rem(x, l) == 0 && x != 0, do: nil, else: x-1) end
end
