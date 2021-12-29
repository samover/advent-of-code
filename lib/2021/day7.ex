defmodule AoC2021.Day7 do
  def getCheapestFuelAlignment(inputPath, rateIncrease) do
    AoC2021.readFileAndParseFirstLineAsIntegerList(inputPath)
      |> (&(calculateMostEfficientPath(&1, [
      buildPointAndFuelCost(&1, Enum.min(&1), rateIncrease),
      buildPointAndFuelCost(&1, Enum.max(&1), rateIncrease),
    ], rateIncrease))).()
  end

  defp calculateMostEfficientPath(alignments, [{ left, leftCost }, { right, rightCost }], rateIncrease) do
    middlePointFuelCost = buildPointAndFuelCost(alignments, div(left + right, 2), rateIncrease)

    cond do
      abs(left - right) == 1 -> if leftCost < rightCost, do: leftCost, else: rightCost
      rightCost > leftCost -> calculateMostEfficientPath(alignments, [{left, leftCost}, middlePointFuelCost], rateIncrease)
      rightCost < leftCost -> calculateMostEfficientPath(alignments, [middlePointFuelCost, {right, rightCost}], rateIncrease)
      rightCost == leftCost -> rightCost
    end
  end
  
  defp calculateFuelCostToPoint(alignments, point, rateIncrease) do
    Enum.reduce(alignments, 0, fn(pos, fuelCost) -> 
      distance = abs(point - pos)
      endPoint = if rateIncrease, do: distance , else: 1
      fuelCost + arithmeticSeriesSum(distance, endPoint)
    end)
  end

  defp buildPointAndFuelCost(alignments, point, rateIncrease) do 
    { point, calculateFuelCostToPoint(alignments, point, rateIncrease) } 
  end

  defp arithmeticSeriesSum(n, xn) do div(n * (1 + xn), 2) end
end
