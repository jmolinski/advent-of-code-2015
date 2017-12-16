defmodule Mix.Tasks.Aoc.Run do
    use Mix.Task
  
    @shortdoc "Execute the solution for a specific day"

    @input_dir "./lib/aoc2015/inputs/"
  
    def run([day]) do
        {:ok, input_body} = File.read(@input_dir <> "day" <> day <> ".txt")
        apply(String.to_existing_atom("Elixir.Aoc.Day" <> day), :run, [input_body])
    end
  end