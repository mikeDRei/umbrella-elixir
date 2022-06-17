defmodule ChatRabbitmqTest do
  use ExUnit.Case
  doctest ChatRabbitmq

  test "greets the world" do
    assert ChatRabbitmq.hello() == :world
  end
end
