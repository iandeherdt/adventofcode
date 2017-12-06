defmodule Solver do
  def solve() do
    File.read("puzzle.txt")
    |> add_lines
  end

  defp add_lines({:ok, contents}) do
    contents
    |> String.split("\n")
    |> Enum.map(&list_of_integers&1)
    |> Enum.map(&get_number_from_line&1)
    |> Enum.sum
  end

  defp get_number_from_line([head | tail]) do
    calculate_line(tail, head, head)
  end

  defp calculate_line([head | tail], highest, lowest) do
    cond do
      head > highest ->
        calculate_line(tail, head, lowest)
      head < lowest ->
        calculate_line(tail, highest, head)
      true -> 
        calculate_line(tail, highest, lowest)
    end
    
  end

  defp calculate_line([], highest, lowest) do 
    IO.inspect highest
    IO.inspect lowest
    highest - lowest
  end

  defp list_of_integers(string) do
    String.split(string, " ", trim: true)
      |> Enum.map(&String.to_integer(&1))
  end
end