defmodule AoC2021.Day3 do
  use Bitwise

  def calculatePowerConsumption(inputPath) do
    AoC2021.readFileAsListLineByLine(inputPath)
      |> Enum.map(&explodeStringToIntegerList/1)
      |> Enum.zip
      |> Enum.reduce(["", ""], fn(tuple), [x, y] ->
        if (countValueInTuple(tuple, 0) > countValueInTuple(tuple, 1)) do
          [addCharacterToEndOfString(x, "0"), addCharacterToEndOfString(y, "1")]
        else
          [addCharacterToEndOfString(x, "1"), addCharacterToEndOfString(y, "0")]
        end
      end)
      |> Enum.map(&binaryToDecimal/1)
      |> Enum.product
  end

  def verifyLifeSupportRating(inputPath) do
    input = AoC2021.readFileAsListLineByLine(inputPath)
    convertInputToBinary(input, &mostCommonValueSieve/1) * convertInputToBinary(input, &leastCommonValueSieve/1)
  end

  def convertInputToBinary(input, recursiveFn) do
    input
      |> Enum.map(&explodeStringToIntegerList/1)
      |> recursiveFn.()
      |> Enum.join
      |> binaryToDecimal
  end

  defp mostCommonValueSieve(list, position \\ 0) do
    t = list 
      |> Enum.zip
      |> Enum.at(position)
    val = if (countValueInTuple(t, 0) > countValueInTuple(t, 1)), do: 0, else: 1 
    newList = list |> Enum.filter(fn(x) -> Enum.at(x, position) === val end)
    if (Enum.count(newList) === 1), do: Enum.at(newList, 0), else: mostCommonValueSieve(newList, position + 1)
  end

  defp leastCommonValueSieve(list, position \\ 0) do
    t = list 
      |> Enum.zip
      |> Enum.at(position)
    val = if (countValueInTuple(t, 0) > countValueInTuple(t, 1)), do: 1, else: 0 
    newList = list |> Enum.filter(fn(x) -> Enum.at(x, position) === val end)
    if (Enum.count(newList) === 1), do: Enum.at(newList, 0), else: leastCommonValueSieve(newList, position + 1)
  end

  defp explodeStringToIntegerList(string) do
    String.graphemes(string) |> Enum.map(&String.to_integer/1)
  end

  defp countValueInTuple(tuple, lookFor) do
    Tuple.to_list(tuple) |> Enum.count(fn(x) -> x === lookFor end)
  end

  defp addCharacterToEndOfString(string, char) do
     string |> Kernel.<>(char)
  end

  defp binaryToDecimal(binaryString) do
    binaryString
      |> String.to_charlist
      |> Enum.reduce_while(0, &update_number/2)
  end

  defp update_number(?0, number), do: {:cont, number <<< 1}
  defp update_number(?1, number), do: {:cont, number <<< 1 ||| 1}
  defp update_number(_, _), do: {:halt, 0}
end
