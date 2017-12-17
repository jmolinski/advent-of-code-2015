defmodule Aoc.Day5 do

    def run(input) do
      input
      |> String.split("\n")
      |> (fn (strings) -> 
            [Enum.count(strings, &is_nice_p1/1), Enum.count(strings, &is_nice_p2/1)] 
          end).()
      |> Enum.join(" ")
      |> IO.puts
    end

    def is_nice_p1(s) do
      hasnt_forbidden = String.contains?(s, ["ab", "cd", "pq", "xy"]) == false
      has_3_vowels = length(Regex.scan(~r/[aeiou]/i, s)) > 2
      has_dupes = length(Regex.scan(~r/(\w)\1+/i, s)) > 0
      Enum.all?([hasnt_forbidden, has_3_vowels, has_dupes])
    end

    def is_nice_p2(s) do
      has_pairs = length(Regex.scan(~r/(\w\w).*\1/i, s)) > 0
      has_sep_dupes = length(Regex.scan(~r/(\w).\1/i, s)) > 0
      Enum.all?([has_pairs, has_sep_dupes])
    end

  end