defmodule Solver do
  def solve(input) do
    numbers = list_of_integers(input);
    [chunk1 | [chunk2 | _ ]] = split(numbers);
    not_circular = add_numbers(chunk1, 0, chunk2);
    add_numbers(chunk2, not_circular, chunk1);
  end
  defp add_numbers([head | tail], sum, [head2 | tail2]) when head == head2 do
    add_numbers(tail, sum + head, tail2)
  end
  defp add_numbers([_ | tail], sum, [_ | tail2]) do
    add_numbers(tail, sum, tail2)
  end
  defp add_numbers([], sum, _), do: sum

  defp split(list) do 
    chunks = round(length(list) /2)
    Enum.chunk(list, chunks ,chunks, [])
  end
  defp list_of_integers(string) do
    String.split(string, "", trim: true)
      |> Enum.map(&String.to_integer(&1))
  end
end