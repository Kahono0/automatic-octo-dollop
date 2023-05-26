FROM bitwalker/alpine-elixir-phoenix:latest

# Set exposed ports
EXPOSE 5000
ENV PORT=5000 MIX_ENV=prod
# Cache elixir deps
ENV DATABASE_URL=postgresql://postgres:1c30Fs4FOavQzHLWg3Vj@containers-us-west-57.railway.app:6028/railway
ENV SECRET_KEY_BASE = "9b7492e9ccdbbca13885d9013a7d1e0da2b260734d35d50c8bc79289a9b28e5e"
ADD mix.exs mix.lock ./
RUN mix do deps.get, deps.compile

# Same with npm deps
ADD assets/package.json assets/
RUN cd assets && \
    npm install

ADD . .

# Run frontend build, compile, and digest assets
RUN cd assets/ && \
    npm run deploy && \
    cd - && \
    mix do compile, phx.digest
#RUN mix ecto.create && \
#    mix ecto.migrate

USER default

CMD ["mix", "phx.server"]
