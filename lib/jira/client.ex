defmodule Jira.Client do
  use HTTPoison.Base

  @base     Application.get_env(:jira, :host)
  @login    Application.get_env(:jira, :login)
  @password Application.get_env(:jira, :password)

  def jql(string) do
    get("/search", [], [params: %{jql: string}] ++ auth)
  end

  def issue(id) do
    get("/issue/#{id}", [], auth)
  end

  def process_response_body(body) do
    body
    |> Poison.decode!
  end

  defp process_url(url) do
    @base <> url
  end

  defp auth do
    [hackney: [basic_auth: {@login, @password}]]
  end
end
