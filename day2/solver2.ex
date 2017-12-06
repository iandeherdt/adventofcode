defmodule Solver do
  def solve() do
    File.read("puzzle2.txt")
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
    IO.inspect "new_line"
    calculate_line(tail, head, [])
  end

  defp calculate_line([head | tail], divisor, acc) do
    IO.inspect "try"
    IO.inspect head
    IO.inspect divisor
    IO.inspect acc
    cond do
      rem(head, divisor) == 0 ->
        IO.inspect "result"
        IO.inspect round(head / divisor)
        round(head / divisor)
      true -> 
        calculate_line(tail, divisor, [head | acc])
    end
  end

  defp calculate_line([], divisor, [head | tail]) do 
    calculate_line(tail ++ [divisor], head, [])
  end

  defp calculate_line([], divisor, []) do 
    0
  end

  defp list_of_integers(string) do
    String.split(string, " ", trim: true)
      |> Enum.map(&String.to_integer(&1))
  end
end