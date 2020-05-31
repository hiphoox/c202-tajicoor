defmodule CompiTajicoor.CLI do
  def main(args \\ []) do
    args
    |> parse_args
    |> response
  end

  defp parse_args(args) do
    {opts, word, _} =
      args
      |> OptionParser.parse(strict: [o: :string, verbose: :boolean, S: :boolean])
    {opts, List.to_string(word)}
  end

  defp response({opts, word}) do
    CompiTajicoor.mainCLI(word,opts[:verbose],opts[:S],opts[:o])
  end
end
