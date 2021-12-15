defmodule AoC2021.Day4 do
  def playBingo(inputPath) do
    input = AoC2021.readFileAsListLineByLine(inputPath)
    numbers = List.first(input)
      |> String.split(",")
      |> Enum.map(&String.to_integer/1)
    boards = parseBingoBoards(Enum.slice(input, 1..-1))
    markNumberOnBoard(numbers, boards)
  end

  def markNumberOnBoard(numbers, boards) do
    currentNumber = List.first(numbers)
    remainingNumbers = Enum.slice(numbers, 1..-1)
    updatedBoards = Enum.map(boards, fn(numberOnBoard) -> if numberOnBoard == currentNumber, do: -1, else: numberOnBoard end)
    isWinner = hasBingo(updatedBoards)
    if (!is_nil(isWinner) || Enum.count(numbers) == 0), do: calculateFinalScore(currentNumber, isWinner), else: markNumberOnBoard(remainingNumbers, updatedBoards)
  end

  def calculateFinalScore(lastCalledNumber, winningBoard) do
    winningBoard
      |> Enum.flat_map(fn(row) -> row end)
      |> Enum.filter(fn(num) -> num != -1 end)
      |> Enum.sum
      |> multiply(lastCalledNumber)
  end

  def multiply(a, b) do
    if is_nil(a) || is_nil(b), do: nil, else: a * b
  end

  def hasBingo(boards) do 
    rows = boards 
      |> Enum.chunk_every(5)
    horizontalBingo = rows 
      |> Enum.find_index(fn(row) -> Enum.sum(row) == -5 end)

    verticalBingo = rows 
      |> Enum.zip
      |> Enum.map(&Tuple.to_list/1)
      |> Enum.flat_map(fn(col) -> Enum.chunk_every(col, 5) |> Enum.map(&Enum.sum/1) end)
      |> Enum.find_index(fn(colSum) -> colSum == -5 end) # 469

    cond do
      !is_nil(horizontalBingo) -> getBoardByIndex(rows, horizontalBingo)
      !is_nil(verticalBingo) -> getBoardByIndex(rows, numberSieve(verticalBingo, 100) * 5)
      true -> nil
    end
  end

  def numberSieve(total, sieve) do
    if (total < sieve), do: total, else: numberSieve(total - sieve, sieve)
  end

  def getBoardByIndex(lines, index) do
    startIndex = index - Kernel.rem(index, 5)
    Enum.slice(lines, startIndex..startIndex+4)
  end

  def parseBingoBoards(input) do
    input
      |> Enum.filter(fn(item) -> item !== "" end)
      |> Enum.map(fn(item) -> String.split(item) end)
      |> Enum.flat_map(fn(list) -> list end)
      |> Enum.map(&String.to_integer/1)
  end
end
