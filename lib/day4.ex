defmodule AoC2021.Day4 do
  def playBingo(boardToGet, inputPath) do
    [head | tail] = AoC2021.readFileAsListLineByLine(inputPath)
    { resultingBoard, bingoNumber } = bingoCarousel(parseBingoNumbers(head), parseBingoBoards(tail), boardToGet)
    if (!is_nil(resultingBoard)), do: calculateFinalScore(bingoNumber, resultingBoard), else: 0
  end

  def bingoCarousel([currentNumber | remainingNumbers], boards, boardToGet) do
    { winningBoard, boardsStillInPlay } = playBingoRound(currentNumber, boards)
    
    cond do
     boardToGet == :getLoser && AoC2021.is_empty?(boardsStillInPlay) -> { winningBoard, currentNumber }
     boardToGet == :getWinner && !AoC2021.is_empty?(winningBoard) -> { winningBoard, currentNumber }
     true -> bingoCarousel(remainingNumbers, boardsStillInPlay, boardToGet)
    end
  end

  def playBingoRound(number, boardsInPlay) do
    markedBoards = markNumberOnBoards(number, boardsInPlay)
    findWinningBoard(markedBoards)
  end

  def findWinningBoard(boards, winningBoards \\ []) do
    rows = boards |> Enum.chunk_every(5)

    horizontalBingoRowIndex = findWinningRowIndex(rows)
    verticalBingoRowIndex = findWinningColumnRowIndex(rows)
    winningBoard = getBoardByIndex(rows, (if is_nil(horizontalBingoRowIndex), do: verticalBingoRowIndex, else: horizontalBingoRowIndex))
    boardsInPlay = AoC2021.subtractArrays(boards, flattenBoard(winningBoard))
    if AoC2021.is_empty?(winningBoard), do: { Enum.slice(winningBoards, 0..4), boardsInPlay }, else: findWinningBoard(boardsInPlay, (winningBoards ++ winningBoard))
  end

  def findWinningRowIndex(rows) do
    rows 
      |> Enum.find_index(fn(row) -> Enum.sum(row) == -5 end)
  end

  def findWinningColumnRowIndex(rows) do
    rows 
      |> Enum.zip
      |> Enum.map(&Tuple.to_list/1)
      |> Enum.flat_map(fn(col) -> Enum.chunk_every(col, 5) |> Enum.map(&Enum.sum/1) end)
      |> Enum.find_index(fn(colSum) -> colSum == -5 end)
      |> numberSieve(div(Enum.count(rows), 5))
      |> AoC2021.multiply(5)
  end

  def markNumberOnBoards(number, boards) do
    Enum.map(boards, fn(numberOnBoard) -> if numberOnBoard == number, do: -1, else: numberOnBoard end)
  end

  def parseBingoNumbers(numbersString) do
    numbersString
      |> String.split(",")
      |> Enum.map(&String.to_integer/1)
  end

  def flattenBoard(board) do
    Enum.flat_map(board, fn(row) -> row end)
  end

  def calculateFinalScore(lastCalledNumber, winningBoard) do
    flattenBoard(winningBoard)
      |> Enum.filter(fn(num) -> num != -1 end)
      |> Enum.sum
      |> AoC2021.multiply(lastCalledNumber)
  end

  def numberSieve(total, _) when is_nil(total), do: total
  def numberSieve(total, sieve) do
    if (total < sieve), do: total, else: numberSieve(total - sieve, sieve)
  end

  def getBoardByIndex(_, index) when is_nil(index), do: []
  def getBoardByIndex(lines, index) when is_integer(index) do
    startIndex = index - Kernel.rem(index, 5)
    Enum.slice(lines, startIndex..startIndex+4)
  end
  def getBoardByIndex(_, _), do: []


  def parseBingoBoards(input) do
    input
      |> Enum.filter(fn(item) -> item !== "" end)
      |> Enum.map(fn(item) -> String.split(item) end)
      |> Enum.flat_map(fn(list) -> list end)
      |> Enum.map(&String.to_integer/1)
  end
end
