defmodule Jira.CLI do
  @usage """
  Usage: jira <COMMAND> [options]

  Commands:

    search <JQL>    - Search the jira API using JQL.
    issue <KEY>     - Get the issue by key.
  """

  def main(args) do
    handle(args)
  end

  def usage do
    Jira.Renderer.stderr(@usage)
    System.halt(1)
  end

  defp handle(["search"|argv]) do
    Jira.CLI.Search.main(argv)
  end

  defp handle(["issue"|argv]) do
    Jira.CLI.Issue.main(argv)
  end

  defp handle([command|_rest]) do
    Jira.Renderer.stderr("Unknown command: #{command}\n")
    usage
  end

  defp handle([]) do
    usage
  end
end
