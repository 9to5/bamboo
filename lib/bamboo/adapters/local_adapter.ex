defmodule Bamboo.LocalAdapter do
  alias Bamboo.SentEmail

  @behaviour Bamboo.Adapter

  def deliver(email, _config) do
    SentEmail.push(email)
  end

  def deliver_async(email, _config) do
    deliver(email, nil)
    Task.async(fn -> :ok end)
  end
end
