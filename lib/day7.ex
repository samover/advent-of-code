defmodule AoC2021.Day7 do
  def getCheapestFuelAlignment(inputPath) do
    alignments = AoC2021.readFileAndParseFirstLineAsIntegerList(inputPath)
    calculateMostEfficientPath(alignments, [
      buildPointAndFuelCost(alignments, Enum.min(alignments)),
      buildPointAndFuelCost(alignments, Enum.max(alignments)),
    ])
  end

  def calculateMostEfficientPath(alignments, [{ left, leftCost }, { right, rightCost }]) do
    middlePointFuelCost = buildPointAndFuelCost(alignments, div(left + right, 2))

    cond do
      abs(left - right) == 1 -> if leftCost < rightCost, do: leftCost, else: rightCost
      rightCost > leftCost -> calculateMostEfficientPath(alignments, [{left, leftCost}, middlePointFuelCost])
      rightCost < leftCost -> calculateMostEfficientPath(alignments, [middlePointFuelCost, {right, rightCost}])
      rightCost == leftCost -> rightCost
    end
  end

  def buildPointAndFuelCost(alignments, point) do {point,calculateFuelCostToPoint(alignments, point)} end

  def calculateFuelCostToPoint(alignments, point) do
    Enum.reduce(alignments, 0, fn(pos, fuelCost) -> fuelCost + abs(point - pos) end)
  end
end
