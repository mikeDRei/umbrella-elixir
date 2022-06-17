defmodule ChatRabbitmq.WorkerReceiveMessage do
  use GenServer
  
  def init(_) do
    {:ok, nil}
  end

  def start_link(_) do
    IO.puts("Worker receive message starter!")
    GenServer.start_link(__MODULE__, nil, name: :worker2)
  end

  def start() do
  {:ok, connection} = AMQP.Connection.open
  {:ok, channel} = AMQP.Channel.open(connection)

  AMQP.Exchange.declare(channel, "talk", :direct)
  {:ok, %{queue: queue_name}} = AMQP.Queue.declare(channel, "", exclusive: true)

  AMQP.Queue.bind(channel, queue_name, "talk", routing_key: "message")

  AMQP.Basic.consume(channel, queue_name, nil, no_ack: true)

  IO.puts " [*] Para sair pressione CTRL+C, CTRL+C"

  wait_for_messages(channel)
  end

  def handle_cast({:break}, _) do
    raise "Informe um valor válido!!"
  end

  def wait_for_messages(channel) do
    receive do
      {:basic_deliver, payload, meta} ->
      IO.puts "#{payload}"

      wait_for_messages(channel)
    end
  end 
end
