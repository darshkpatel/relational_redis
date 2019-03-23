from redis import ResponseError

from connection import redis
import sqlite3


def load_from_db(db_name, table_name):
    """
    Assumes only one table in the db
    Also, does not retains key relationships
    :param db_name:
    :param table_name:
    :return:
    """
    redis.execute_command("REDISQL.CREATE_DB", table_name)
    conn = sqlite3.connect(db_name)
    conn.row_factory = sqlite3.Row
    c = conn.cursor()
    schema_tuple = []
    schema = c.execute(f"PRAGMA table_info('{table_name}')").fetchall()  # fetches schema of the table
    for row in schema:
        schema_tuple.append(f"{row[1]} {row[2]}")
    schema_tuple = tuple(schema_tuple)
    create_table_query = f"""CREATE TABLE IF NOT EXISTS {table_name}{schema_tuple};"""
    print(create_table_query)
    p = redis.execute_command("REDISQL.EXEC", table_name, create_table_query)

    rows = c.execute(f"SELECT * FROM {table_name};").fetchall()
    conn.row_factory = None
    for row in rows:
        statement = f"INSERT INTO {table_name} VALUES{tuple(row)};"
        print(statement)
        try:
            redis.execute_command("REDISQL.EXEC", table_name, statement)
        except ResponseError:
            pass


load_from_db("data.sqlite", "customers")
