defmodule AoC2021 do
  def readFileAsListLineByLine(inputPath) do
    {:ok, file} = File.read(inputPath)
    file|> String.split("\n")
  end
end