defmodule HabiticaBackend.Factory do
  use ExMachina.Ecto, repo: HabiticaBackend.Repo

  alias HabiticaBackend.Todotasks

    def todotasks_factory do
      %Todotasks{
        task: sequence(:task, &"Test task #{&1}"),
        completed: false,
        difficulty: "easy"
      }
  end
end

