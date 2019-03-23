from flask import Flask, jsonify, request
from flask_cors import CORS
import sqlite3

app = Flask(__name__)
from connection import redis
from conf import TABLE_NAME, DB_NAME
import time

CORS(app, resources=r"*")


@app.route('/query', methods=["POST"])
def query():
    if request.method == "POST":
        query = request.form["query"]
        print(query)
    else:
        return jsonify({"err": "Invalid parameters"})
    start_redis = time.time()
    redis.execute_command("REDISQL.EXEC", TABLE_NAME, query)
    end_redis = time.time() - start_redis
    conn = sqlite3.connect(DB_NAME)
    c = conn.cursor()
    start_sqlite = time.time()
    c.execute(str(query))
    end_sqlite = time.time() - start_sqlite

    c.close()
    return jsonify({
        "time_taken_redis": end_redis,
        "time_taken_sqlite": end_sqlite
    })


app.run(host='0.0.0.0', port='8080', debug=True)
