defmodule Jira.CLI.Search do
  def main(args) do
    args
    |> parse_args
    |> handle_call
  end

  defp handle_call({_, [jql], _}) do
    Jira.Client.jql(jql)
    |> render
  end

  defp handle_call({_, [], _}) do
    Jira.CLI.usage
  end

  defp parse_args(args) do
    OptionParser.parse(args)
  end

  defp render({:ok, %HTTPoison.Response{body: body}}) do
    Jira.Renderer.json body
  end

  defp render({:error, %HTTPoison.Error{reason: reason}}) do
    Jira.Renderer.stderr reason
  end
end

