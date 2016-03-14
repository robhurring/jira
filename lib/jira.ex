defmodule Jira do
  use Application

  def start(_type, _args) do
    Jira.Supervisor.start_link
  end
end
