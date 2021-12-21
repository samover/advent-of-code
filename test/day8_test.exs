defmodule Day8Test do
  use ExUnit.Case
  doctest AoC2021.Day8

  test "test input - count only numbers that use a unique number of segments" do
    assert AoC2021.Day8.countEasyOutputDigits(Path.expand("./test/resources/day8_test_input")) == 26
  end
  test "real input - count only numbers that use a unique number of segments" do
    assert AoC2021.Day8.countEasyOutputDigits(Path.expand("./test/resources/day8_real_input")) == 367
  end

  test "&buildSegmentDictionary/1" do
    input = ["be", "cfbegad", "cbdgef", "fgaecd", "cgeb", "fdcge", "agebfd", "fecdb", "fabcd", "edb"]
            # 1     8           9         6         4       5       0         3         2       7
    assert AoC2021.Day8.buildSegmentDictionary(input) == [{1, "be"}, {8, "cfbegad"}, {4, "cgeb"}, {7, "edb"}, {9, "cbdgef"}, {6, "fgaecd"}, {0, "agebfd"}, {3, "fecdb"}, {5, "fdcge"}, {2, "fabcd"}]
  end

  test "read display (test input)" do
    assert AoC2021.Day8.sumDisplayOutput(Path.expand("./test/resources/day8_test_input")) == 61229
  end

  test "read display (real input)" do
    assert AoC2021.Day8.sumDisplayOutput(Path.expand("./test/resources/day8_real_input")) == 974512
  end

  describe "matchesPattern?/3" do
    test "matches pattern exclusively for FIVE" do
      segment = "fdcge" # missing ab
      knownPatterns = [{8, "cfbegad"}, {9, "cbdgef"}, {6, "fgaecd"}]
      assert AoC2021.Day8.five?(segment, knownPatterns) == true
    end
    test "matches pattern exclusively for THREE" do
      segment = "fecdb" # missing eg
      knownPatterns = [{1, "be"}, {8, "cfbegad"}, {4, "cgeb"}, {7, "edb"}]
      assert AoC2021.Day8.three?(segment, knownPatterns) == true
    end
    test "matches pattern exclusively for NINE" do
      segment = "cbdgef"
      knownPatterns = [{1, "be"}, {8, "cfbegad"}, {4, "cgeb"}, {7, "edb"}]
      assert AoC2021.Day8.zero?(segment, knownPatterns) == false
      assert AoC2021.Day8.six?(segment, knownPatterns) == false
      assert AoC2021.Day8.nine?(segment, knownPatterns) == true
    end
    test "matches pattern exclusively for SIX" do
      segment = "fgaecd"
      knownPatterns = [{1, "be"}, {8, "cfbegad"}, {4, "cgeb"}, {7, "edb"}]
      assert AoC2021.Day8.zero?(segment, knownPatterns) == false
      assert AoC2021.Day8.nine?(segment, knownPatterns) == false
      assert AoC2021.Day8.six?(segment, knownPatterns) == true
    end
    test "matches pattern exclusively for ZERO" do
      segment = "agebfd"
      knownPatterns = [{1, "be"}, {8, "cfbegad"}, {4, "cgeb"}, {7, "edb"}]
      assert AoC2021.Day8.nine?(segment, knownPatterns) == false
      assert AoC2021.Day8.six?(segment, knownPatterns) == false
      assert AoC2021.Day8.zero?(segment, knownPatterns) == true
    end
  end
end
