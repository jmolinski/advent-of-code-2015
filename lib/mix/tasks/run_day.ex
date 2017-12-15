defmodule Mix.Tasks.Aoc2015.Day do
    use Mix.Task
  
    @shortdoc "Execute the solution for a specific day"

    @input_dir "./lib/aoc2015/inputs/"
  
    def run([day]) do
        {:ok, input_body} = File.read(@input_dir <> "day" <> day <> ".txt")
        apply(String.to_existing_atom("Elixir.AoC2015.Day" <> day), :run, [input_body])
    end
  end