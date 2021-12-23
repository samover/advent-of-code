defmodule AoC2021.Day10 do
  @syntax_error_dictionary %{")" => 3, "]" => 57, "}" => 1_197, ">" => 25_137}
  @autocomplete_dictionary %{")" => 1, "]" => 2, "}" => 3, ">" => 4}

  def check_syntax(input) do
    input
      |> Enum.map(&filter_pairs/1)
      |> Enum.filter(&filter_incomplete_chunks/1)
      |> Enum.map(&find_first_corruption/1)
      |> Enum.map(&get_syntax_error_score/1)
      |> Enum.sum
  end

  def complete_uncorrupted_lines(input) do
    input
      |> Enum.map(&filter_pairs/1)
      |> Enum.filter(&filter_corrupt_chunks/1)
      |> Enum.map(&get_autocomplete_score/1)
      |> Enum.map(&Enum.reverse/1)
      |> Enum.map(&calculate_autocomplete_score/1)
      |> Enum.sort
      |> get_middle_score
  end

  defp get_middle_score(scores) do
    Enum.at(scores, div(Enum.count(scores), 2))
  end

  defp calculate_autocomplete_score(individual_scores) do
    Enum.reduce(individual_scores, 0, fn(score, val) -> (val * 5) + score end)
  end

  defp find_first_corruption(line) do
    String.split(line, "", trim: true)
      |> Enum.find(line, &closing_char?/1)
  end

  defp get_syntax_error_score(char) do
    Map.fetch!(@syntax_error_dictionary, char)
  end

  defp get_autocomplete_score(line) do
    String.split(line, "", trim: true)
      |> Enum.map(&Map.fetch!(@autocomplete_dictionary, get_closing_char(&1)))
  end

  defp filter_pairs(line) do
    filtered = Regex.replace(~r/\[\]|\<\>|\{\}|\(\)/, line, "", trim: true)
    if filtered == line, do: filtered, else: filter_pairs(filtered)
  end

  defp filter_incomplete_chunks(line) do
    String.split(line, "", trim: true)
      |> Enum.any?(&closing_char?/1)
  end
  defp filter_corrupt_chunks(line) do
    String.split(line, "", trim: true)
      |> Enum.all?(&opening_char?/1)
  end

  defp opening_char?(char), do: Enum.any?(["[", "(", "{", "<"], &(&1 == char))
  defp closing_char?(char), do: Enum.any?(["]", ")", "}", ">"], &(&1 == char))
  def get_closing_char("["), do: "]"
  def get_closing_char("("), do: ")"
  def get_closing_char("<"), do: ">"
  def get_closing_char("{"), do: "}"
  def get_closing_char(_), do: nil
end
