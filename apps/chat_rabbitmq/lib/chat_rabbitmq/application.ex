defmodule ChatRabbitmq.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Starts a worker by calling: ChatRabbitmq.Worker.start_link(arg)
        {ChatRabbitmq.WorkerSendMessage, nil},
        {ChatRabbitmq.WorkerReceiveMessage, nil}
        
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ChatRabbitmq.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
