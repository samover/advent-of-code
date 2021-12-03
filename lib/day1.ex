defmodule AoC2021.Day1 do
  def countIncreasedDepth(inputPath, windowSize) do
    AoC2021.readFileAsListLineByLine(inputPath)
      |> Enum.map(&String.to_integer/1)
      |> Enum.chunk_every(windowSize, 1, :discard)
      |> Enum.map(&Enum.sum/1)
      |> countIncreasing()
  end

  defp countIncreasing(list) do
    list
      |> Enum.with_index
      |> Enum.reduce(0, fn({x, i}, acc) ->
        if (x > Enum.at(list, i - 1)), do: acc + 1, else: acc
      end)
  end
end
