defmodule Aoc.Day1 do

    def run(input) do
      input
      |> String.graphemes
      |> Enum.map(&(if &1 == "(", do: 1, else: -1))
      |> (&([part_1(&1), part_2(&1)])).()
      |> Enum.join(" ")
      |> IO.puts
    end

    def part_1(steps) do
      Enum.reduce(steps, 0, &(&1 + &2))
    end

    def part_2(steps) do
      Enum.reduce_while(steps, {0, 0}, 
        fn (v, {step, acc}) -> 
        if acc == -1, do: {:halt, step}, else: {:cont, {step + 1, acc + v}} end)
    end

  end