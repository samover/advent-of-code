defmodule AoC2020 do
  def parse_file_to_line_list path do
    File.read!(path)
      |> String.split("\n")
  end
end
