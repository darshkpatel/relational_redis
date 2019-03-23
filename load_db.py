from redis import ResponseError

from connection import redis
import sqlite3
from conf import DB_NAME, TABLE_NAME


def load_from_db():
    """
    Assumes only one table in the db
    Also, does not retains key relationships
    :return:
    """
    redis.execute_command("REDISQL.CREATE_DB", TABLE_NAME)
    conn = sqlite3.connect(DB_NAME)
    conn.row_factory = sqlite3.Row
    c = conn.cursor()
    schema_tuple = []
    schema = c.execute(f"PRAGMA table_info('{TABLE_NAME}')").fetchall()  # fetches schema of the table
    for row in schema:
        schema_tuple.append(f"{row[1]} {row[2]}")
    schema_tuple = tuple(schema_tuple)
    create_table_query = f"""CREATE TABLE IF NOT EXISTS {TABLE_NAME}{schema_tuple};"""
    print(create_table_query)
    p = redis.execute_command("REDISQL.EXEC", TABLE_NAME, create_table_query)

    rows = c.execute(f"SELECT * FROM {TABLE_NAME};").fetchall()
    conn.row_factory = None
    for row in rows:
        statement = f"INSERT INTO {TABLE_NAME} VALUES{tuple(row)};"
        print(statement)
        try:
            redis.execute_command("REDISQL.EXEC", TABLE_NAME, statement)
        except ResponseError:
            pass
