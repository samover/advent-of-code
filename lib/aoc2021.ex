defmodule AoC2021 do
  def readFileAsListLineByLine(inputPath) do
    {:ok, file} = File.read(inputPath)
    file|> String.split("\n")
  end

  def readFileAndParseFirstLineAsIntegerList(inputPath) do
    readFileAsListLineByLine(inputPath) |> List.first
      |> String.split(",")
      |> Enum.map(&String.to_integer/1)
  end

  def multiply(a,b) when is_nil(a) or is_nil(b), do: nil
  def multiply(a, b), do: a * b

  def subtractArrays(a, b, startIndex \\ 0)
  def subtractArrays(a, b, startIndex) when is_list(a) and is_list(b) do
    cond do
      startIndex > Enum.count(a) - Enum.count(b) -> a
      Enum.slice(a, startIndex, Enum.count(b)) == b ->
        (if startIndex == 0, do: [], else: Enum.slice(a, 0..startIndex - 1)) ++ Enum.slice(a, (startIndex + Enum.count(b))..-1)
      true -> subtractArrays(a, b, startIndex + 1)
    end
  end
  def subtractArrays(_, _, _), do: nil

  def is_empty?(list) when is_list(list), do: Enum.count(list) == 0
  def is_empty?(_), do: true
end
