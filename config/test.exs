use Mix.Config

config :cqerl,
  cassandra_nodes: [{System.get_env("CASSANDRA_DB_HOST") || "cassandra", System.get_env("CASSANDRA_DB_PORT") || 9042}]

config :astarte_realm_management, :amqp_connection,
  username: "guest",
  password: "guest",
  hostname: "rabbitmq",
  virtual_host: "/",
  port: 5672

config :astarte_realm_management, :amqp_consumer,
  queue: "realm_management_rpc",
  callback: &Astarte.RealmManagement.Engine.process_rpc/1
