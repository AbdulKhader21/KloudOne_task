-- PUB (Port-9999)

CREATE EXTENSION pglogical;

SELECT pglogical.create_node(
    node_name := 'provider1',
    dsn := 'host=localhost port=9999 dbname=db'
);

SELECT pglogical.replication_set_add_all_tables('default', ARRAY['public']);



-- SUB (Port-7777)

CREATE EXTENSION pglogical;

SELECT pglogical.create_node(
    node_name := 'subscriber1',
    dsn := 'host=localhost port=7777 dbname=db'
);

SELECT pglogical.create_subscription(
    subscription_name := 'subscription1',
    provider_dsn := 'host=localhost port=9999 dbname=db'
);

