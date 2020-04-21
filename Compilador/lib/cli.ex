defmodule CompiTajicoor.CLI do
  def main(args \\ []) do
    args
    |> parse_args
    |> response
    #|> IO.puts()
  end

  defp parse_args(args) do
    {opts, word, _} =
      args
      #|> OptionParser.parse(switches: [upcase: :boolean])
      |> OptionParser.parse(strict: [o: :string, verbose: :boolean, S: :boolean])
    {opts, List.to_string(word)}
  end

  defp response({opts, word}) do
    #if opts[:verbose], do: String.upcase(word), else: word
    CompiTajicoor.mainCLI(word,opts[:verbose],opts[:S],opts[:o])
  end
end
