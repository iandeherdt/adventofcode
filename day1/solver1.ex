defmodule Solver do
  def solve(input) do
    numbers = list_of_integers(input);
    [head | _] = numbers
    circular = numbers ++ [head]
    add_numbers(circular, 0, 0);
  end
  defp add_numbers([head | tail], sum, previous) when head == previous do
    add_numbers(tail, sum + head, head)
  end
  defp add_numbers([head | tail], sum, _) do
    add_numbers(tail, sum, head)
  end
  defp add_numbers([], sum, _), do: sum
  defp list_of_integers(string) do
    String.split(string, "", trim: true)
      |> Enum.map(&String.to_integer(&1))
  end
end