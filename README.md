# Pesapie

To start your Phoenix server:

  * Run `mix setup` to install and setup dependencies
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000/graphiql`](http://localhost:4000/graphiql) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Start docker database

```bash
docker compose up -d
```
## TOD0:
 - Fix failing tests
 - Upload files to S3 using https://github.com/aws-beam/aws-elixir


## How to upload files

```console
curl -X POST \
-F 'query=mutation { uploadFile(imageFile: "car_photo")}' \
-F car_photo=@car.jpeg \
http://localhost:4000/graphiql
```
