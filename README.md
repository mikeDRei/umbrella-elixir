# Umbrella

**TODO: Add description**
Sometimes a project can get big, really big in fact. The Mix build tool allows us to split our code into multiple apps and make our Elixir projects more manageable as they grow.

**Rabbimq**
This tutorial assumes RabbitMQ is installed and running on localhost on the standard port (5672). In case you use a different host, port or credentials, connections settings would require adjusting.

## Installation

```bash
mix deps.get
mix deps.compile
```
# Running Chat_Rabbitmq
## Worker send message
```bash
iex -S mix
ChatRabbitmq.WorkerSendMessage.start()
```
## Worker receive message
```bash
iex -S mix
ChatRabbitmq.WorkerReceiveMessage.start()
```
# Running Worker_Tutorial (Supervisor)

```bash
iex -S mix
WorkerTutorial.Worker.call()
```
