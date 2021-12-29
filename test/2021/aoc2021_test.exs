defmodule AoC2021Test do
  use ExUnit.Case
  doctest AoC2021

  test "subtract array at the start" do
    assert AoC2021.subtractArrays([1,2,3,4], [1,2]) == [3,4]
  end
  test "subtract array in the middle" do
    assert AoC2021.subtractArrays([1,2,3,4], [2,3]) == [1,4]
  end
  test "subtract array at the end" do
    assert AoC2021.subtractArrays([1,2,3,4], [3,4]) == [1,2]
  end

  test "subtracting longer array" do
    assert AoC2021.subtractArrays([1,2,3,4], [1,2,3,4,5,6]) == [1,2,3,4]
  end

  test "subtracting array that is no subarray of first array" do
    assert AoC2021.subtractArrays([1,2,3,4], [5,6]) == [1,2,3,4]
  end

  test "returns true for an empty array" do
    assert AoC2021.is_empty?([]) == true
  end
  test "returns true for nil" do
    assert AoC2021.is_empty?(nil) == true
  end
  test "returns false for array containing elements" do
    assert AoC2021.is_empty?([1]) == false
  end
end
