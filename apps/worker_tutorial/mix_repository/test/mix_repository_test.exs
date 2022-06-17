defmodule MixRepositoryTest do
  use ExUnit.Case
  doctest MixRepository

  test "greets the world" do
    assert MixRepository.hello() == :world
  end
end
