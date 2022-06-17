defmodule ChatRabbitmq.WorkerSendMessage do
  use GenServer
  
  def init(_) do
    {:ok, nil}
  end

  def start_link(_) do
    IO.puts("Worker send message starter!")
    GenServer.start_link(__MODULE__, nil, name: :worker)
  end

  def start() do
    name = IO.gets("Informe seu nome: ")
    send_message(name)
  end

  def handle_cast({:break}, _) do
    raise "Informe um valor válido!!"
  end

  def send_message(name) do
    {:ok, connection} = AMQP.Connection.open
    {:ok, channel} = AMQP.Channel.open(connection)
    
    message = IO.gets("> ")

    if String.length(name) <= 1 || String.length(message) <= 1 do
      GenServer.cast(:worker,{:break})
    end

    message_text = " #{name}  " <> message
    AMQP.Exchange.declare(channel, "talk", :direct)

    AMQP.Basic.publish(channel, "talk", "message", String.replace(message_text,"\n"," "))
    send_message(name)
  end
end
