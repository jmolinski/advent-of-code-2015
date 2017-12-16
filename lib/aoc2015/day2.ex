defmodule Aoc.Day2 do

    def run(input) do
      input
      |> parse
      |> (&([part_1(&1), part_2(&1)])).()
      |> Enum.join(" ")
      |> IO.puts
    end

    def parse(input) do
      input
      |> String.split("\n")
      |> Enum.map(&(String.split(&1, "x")))
      |> Enum.map(&(Enum.map(&1, fn (x) -> String.to_integer(x) end)))
    end

    def part_1(packages) do
      packages
      |> Enum.map(fn ([a, b, c]) -> 2*(a*b + a*c + b*c) + Enum.min([a*b, a*c, b*c]) end)
      |> Enum.sum
    end

    def part_2(packages) do
      packages
      |> Enum.map(&Enum.sort/1)
      |> Enum.map(fn ([a, b, c]) -> a*b*c + 2*(a+b) end)
      |> Enum.sum
    end

  end