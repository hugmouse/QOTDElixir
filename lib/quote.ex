defmodule Quote do
  @quotes ["A random quote of the day!", "Another random quote of the day!", "Yet another random quote of the day!"]

  def random_quote() do
    Enum.random(@quotes)
  end
end

defmodule QOTDServer do
  require Logger

  def start(port) do
    {:ok, socket} = :gen_tcp.listen(port, [mode: :binary, active: false, reuseaddr: true, packet: :line])
    Logger.info("Listening on port #{port}")

    accept_loop(socket)
  end

  def accept_loop(socket) do
    {:ok, client} = :gen_tcp.accept(socket)
    Logger.info("Accepted connection from #{inspect client}")

    spawn(fn -> handle_client(client) end)

    accept_loop(socket)
  end

  def handle_client(socket) do
    :gen_tcp.send(socket, Quote.random_quote() <> "\n")
    :gen_tcp.shutdown(socket, :read_write)
    :gen_tcp.close(socket)
    Logger.info("Closed connection")
  end
end
