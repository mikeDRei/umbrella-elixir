defmodule WorkerTutorial.Server do
  use GenServer

  require Integer
  def init(_) do
    {:ok, nil}
  end

  def start_link(_) do
    IO.puts("Servidor inicializado!")
    GenServer.start_link(__MODULE__, nil, name: __MODULE__)
  end

  def handle_cast({:run, 8}, _) do
    raise "Erro"
  end

  def handle_cast({:run, 10}, _) do
    raise "Erro"
  end

  def handle_cast({:run, 15}, _) do
    raise "Erro"
  end

  def handle_cast({:run, 20}, _) do
    raise "Erro"
  end

  def handle_cast({:run, number}, _) do
    IO.puts("Numero #{number} foi recebido!")
    {:noreply, nil}
  end
end
