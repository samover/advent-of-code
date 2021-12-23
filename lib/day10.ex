defmodule AoC2021.Day10 do
  @syntax_error_dictionary %{")" => 3, "]" => 57, "}" => 1197, ">" => 25137}

  def check_syntax(input) do
    input
      |> Enum.map(&filter_pairs/1)
      |> Enum.filter(&filter_incomplete_chunks/1)
      |> Enum.map(&find_first_corruption/1)
      |> Enum.map(&get_syntax_error_score/1)
      |> Enum.sum
  end

  defp find_first_corruption(line) do
    String.split(line, "", trim: true)
      |> Enum.find(line, &closing_char?/1)
  end

  defp get_syntax_error_score(char) do
    Map.fetch!(@syntax_error_dictionary, char)
  end

  defp filter_pairs(line) do
    filtered = Regex.replace(~r/\[\]|\<\>|\{\}|\(\)/, line, "", trim: true)
    if filtered == line, do: filtered, else: filter_pairs(filtered)
  end

  defp filter_incomplete_chunks(line) do
    String.split(line, "", trim: true)
      |> Enum.any?(&closing_char?/1)
  end

  defp closing_char?(char), do: Enum.any?(["]", ")", "}", ">"], &(&1 == char))
end
