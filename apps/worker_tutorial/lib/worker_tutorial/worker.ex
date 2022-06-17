defmodule WorkerTutorial.Worker do
  def call (number \\ 0) do
    IO.puts("Enviando o numero #{number}")
    GenServer.cast(WorkerTutorial.Server, {:run, number})
    :timer.sleep(1000)
    call(number + 1)
  end
end
