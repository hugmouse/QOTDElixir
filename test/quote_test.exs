defmodule QuoteTest do
  use ExUnit.Case

  test "receive quote from server" do

    server_pid = spawn(fn -> QOTDServer.start(8081) end)

    {:ok, socket} = :gen_tcp.connect('localhost', 8081, [mode: :binary, active: false, packet: :line])
    case :gen_tcp.recv(socket, 0) do
      {:ok, line} ->
        assert String.contains?(line, "quote")
        :ok = :gen_tcp.close(socket)
      {:error, _} ->
        assert false
    end

    Process.exit(server_pid, :kill)
  end
end
