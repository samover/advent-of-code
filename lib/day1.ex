defmodule Day1 do
  def countIncreasedDepth(inputPath) do
    {:ok, file} = File.read(inputPath)
    list = file|> String.split("\n") |> Enum.map(&String.to_integer/1)

    list
      |> Enum.with_index
      |> Enum.reduce(0, fn({x, i}, acc) ->
        if (x > Enum.at(list, i - 1)), do: acc + 1, else: acc
      end)
  end

  def countIncreasedDepthBySlidingWindow(inputPath) do
    {:ok, file} = File.read(inputPath)
    list = file|> String.split("\n") |> Enum.map(&String.to_integer/1)

    list
      |> Enum.with_index
      |> Enum.reduce(0, fn({x, i}, acc) ->
        if (i + 3 > length(list) - 1) do
          acc
        else
          slidingWindowOne = Enum.slice(list, i..i+2) |> Enum.sum()
          slidingWindowTwo = Enum.slice(list, i+1..i+3) |> Enum.sum()
          if (slidingWindowTwo > slidingWindowOne), do: acc + 1, else: acc
        end
      end)
  end
end
