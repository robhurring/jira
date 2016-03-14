defmodule Jira.Renderer do
  use GenServer

  @pretty Application.get_env(:jira, :pretty_print)

  # Public API

  def start_link do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  def puts(string) do
    GenServer.call(__MODULE__, {:puts, string})
  end

  def stderr(string) do
    GenServer.call(__MODULE__, {:stderr, string})
  end

  def json(struct) do
    json = Poison.encode!(struct, pretty: @pretty)
    GenServer.call(__MODULE__, {:puts, json})
  end

  # OTP API

  def handle_call({:puts, string}, _from, state) do
    IO.puts string
    {:reply, :ok, state}
  end

  def handle_call({:stderr, string}, _from, state) do
    IO.puts :stderr, string
    {:reply, :ok, state}
  end
end
