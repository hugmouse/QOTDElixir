# QOTDElixir

RFC865 (Quote of the Day) Elixir implementation, TCP based

## Testing

You can test it out using `mix test`:

```
~ mix test

13:37:01.851 [info] Listening on port 8081

13:37:01.862 [info] Accepted connection from #Port<0.5>

13:37:01.863 [info] Closed connection
.
Finished in 0.03 seconds (0.00s async, 0.03s sync)
1 test, 0 failures
```

## Use it

You can try it in interactive mode using `iex -S mix`:

```
iex(1)> QOTDServer.start(8081)

13:37:35.289 [info] Listening on port 8081
```