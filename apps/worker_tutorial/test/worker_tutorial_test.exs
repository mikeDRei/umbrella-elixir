defmodule WorkerTutorialTest do
  use ExUnit.Case
  doctest WorkerTutorial

  test "greets the world" do
    assert WorkerTutorial.hello() == :world
  end
end
