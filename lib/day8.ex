defmodule AoC2021.Day8 do
  def countEasyOutputDigits(inputPath) do
    parseInput(inputPath)
      |> Enum.map(&Enum.at(&1, -1))
      |> Enum.flat_map(&filterStringsByLength(&1, [2,3,4,7]))
      |> Enum.count
  end

  defp filterStringsByLength(list, filter) do
    Enum.filter(list, fn(item) -> Enum.any?(filter, fn(i) ->
      String.length(item) == i end)
    end)
  end

  def sumDisplayOutput(inputPath) do
    parseInput(inputPath)
      |> Enum.map(&readDisplay/1)
      |> Enum.sum
  end

  def readDisplay([uniquePatterns, displayOutput]) do
    Enum.map(displayOutput, fn(outputSegment) ->
      {digit,_} = Enum.find(buildSegmentDictionary(uniquePatterns), fn({_,seg}) ->
        areSegmentsEqual?(seg, outputSegment) end)
      digit
    end)
    |> Enum.join("")
    |> String.to_integer
  end

  def areSegmentsEqual?(segA, segB) do
    String.length(segA) == String.length(segB) &&
      Enum.empty?(String.split(segA, "", trim: true) -- String.split(segB, "", trim: true))
  end

  def lookupByLength(segment) do
    cond do
      one?(segment) -> { 1, segment }
      four?(segment) -> { 4, segment }
      seven?(segment) -> { 7, segment }
      eight?(segment) -> { 8, segment }
      true -> nil
    end
  end
  @spec lookupBySimilarity(binary, any) :: nil | {0 | 3 | 6 | 9, binary}
  def lookupBySimilarity(segment, patterns) do
    cond do
      zero?(segment, patterns) -> { 0, segment }
      three?(segment, patterns) -> { 3, segment }
      six?(segment, patterns) -> { 6, segment }
      nine?(segment, patterns) -> { 9, segment }
      true -> nil
    end
  end

  def three?(segment, knownSegments) do String.length(segment) == 5 && matchesPattern?(segment, knownSegments, [1,7]) end
  def zero?(segment, knownSegments) do String.length(segment) == 6 && matchesPattern?(segment, knownSegments, [1,7]) end
  def six?(segment, knownSegments) do String.length(segment) == 6 && matchesPattern?(segment, knownSegments) end
  def nine?(segment, knownSegments) do String.length(segment) == 6 && matchesPattern?(segment, knownSegments, [1,4,7]) end
  def one?(segment) do String.length(segment) == 2 end
  def four?(segment) do String.length(segment) == 4 end
  def seven?(segment) do String.length(segment) == 3 end
  def eight?(segment) do String.length(segment) == 7 end


  def five?(segment, knownSegments) do
    segmentToMatch = getSegment(knownSegments, 9) -- (getSegment(knownSegments, 8) -- getSegment(knownSegments, 6))
    String.split(segment, "", trim: true) -- segmentToMatch == []
  end

  def getSegment(knownSegments, digit) do
    Enum.find(knownSegments, fn({d,_}) -> d == digit end)
      |> elem(1)
      |> String.split("", trim: true)
  end

  def matchesPattern?(segment, knownPatterns, matchingPatterns \\ []) do
    Enum.filter(knownPatterns, fn({digit,_}) -> Enum.all?(matchingPatterns, fn(pattern) -> pattern != digit end) end)
      |> Enum.map(fn({_,seg}) -> seg end)
      |> Enum.all?(fn(pattern) -> !stringContains(segment, pattern) end)
      &&
    Enum.filter(knownPatterns, fn({digit,_}) -> Enum.any?(matchingPatterns, fn(pattern) -> pattern == digit end) end)
      |> Enum.map(fn({_,seg}) -> seg end)
      |> Enum.all?(fn(pattern) -> stringContains(segment, pattern) end)
  end

  def buildSegmentDictionary(encodedSegments) do
    firstPass = Enum.map(encodedSegments, &lookupByLength/1) |> Enum.filter(fn(x) -> !is_nil(x) end)
    remainingSegments = encodedSegments -- Enum.map(firstPass, fn({_,segm}) -> segm end)
    secondPass = Enum.concat(firstPass, Enum.map(remainingSegments, fn(segm) -> lookupBySimilarity(segm, firstPass) end))
      |> Enum.filter(fn(x) -> !is_nil(x) end)
    remainingSegments = encodedSegments -- Enum.map(secondPass, fn {_,s} -> s end)
    thirdPass = Enum.map(remainingSegments, fn(seg) ->
      if five?(seg, secondPass), do: { 5, seg }, else: { 2, seg }
    end)
    Enum.concat(secondPass, thirdPass)
  end

  def stringContains(a, b) do
    Enum.count(String.split(a, "") -- String.split(b, "")) == String.length(a) - String.length(b)
  end

  def parseInput(path) do
    AoC2021.readFileAsListLineByLine(path)
    |> Enum.map(fn(line) -> String.split(line, "|")
      |> Enum.map(fn(line) -> String.split(line) end) end)
  end
end
