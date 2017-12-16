defmodule Aoc.Day3 do

    def run(input) do
      input
      |> parse
      |> (&([part_1(&1), part_2(&1)])).()
      |> Enum.join(" ")
      |> IO.puts
    end

    def parse(input) do
      input
      |> String.graphemes
      |> Enum.map(&direction_to_vector/1)
    end

    def direction_to_vector(d) do
      %{"^" => {0, 1}, "v" => {0, -1}, ">" => {1, 0}, "<" => {-1, 0}}[d]
    end

    def add_vectors({x_v, y_v}, {x, y}) do
      {x + x_v, y + y_v}
    end

    def part_1(directions) do
      directions
      |> Enum.scan({0, 0}, &add_vectors/2)
      |> Enum.uniq |> Enum.count
    end

    def part_2(directions) do
      robo_directions = directions |> Enum.take_every(2)
      santa_directions = directions |> Enum.drop(1) |> Enum.take_every(2)
      robo_houses = Enum.scan(robo_directions, {0, 0}, &add_vectors/2)
      santa_houses = Enum.scan(santa_directions, {0, 0}, &add_vectors/2)
      robo_houses ++ santa_houses 
      |> Enum.uniq |> Enum.count
    end

  end