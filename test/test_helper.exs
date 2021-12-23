ExUnit.start()

defmodule ReadInput do
  def line_list(path) do
    File.read(path)
      |> (fn({:ok, file}) -> String.split(file, "\n") end).()
  end
end
