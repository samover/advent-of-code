defmodule AoC2021.Day6 do
  @newLanternFishDaysToSpawn 8
  @lanternFishDaysToSpawn 6

  def lanternFishSpawningPredictor(inputPath, daysToSpawn) do
    parseInputToListOfFish(inputPath)
      |> Enum.reduce({0,0,0,0,0,0,0,0,0}, fn(fish, acc) -> put_elem(acc, fish, elem(acc, fish) + 1) end)
      |> updateFishPopulation(daysToSpawn)
      |> Tuple.to_list
      |> Enum.sum
  end

  def parseInputToListOfFish(inputPath) do
    AoC2021.readFileAsListLineByLine(inputPath) |> List.first
      |> String.split(",")
      |> Enum.map(&String.to_integer/1)
  end

  def updateFishPopulation(fishCountPerAge, daysToSpawn) do
    updatedFishCount = fishCountPerAge
      |> Tuple.delete_at(0)
      |> Tuple.insert_at(@newLanternFishDaysToSpawn, elem(fishCountPerAge, 0))
      |> put_elem(@lanternFishDaysToSpawn, elem(fishCountPerAge, 0) + elem(fishCountPerAge, @lanternFishDaysToSpawn + 1))
      
    if daysToSpawn > 1, do: updateFishPopulation(updatedFishCount, daysToSpawn - 1), else: updatedFishCount
  end
end
