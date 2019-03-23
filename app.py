from flask import Flask, jsonify, request
from flask_cors import CORS
import sqlite3
app = Flask(__name__)
from connection import redis
from conf import TABLE_NAME
import time

conn = sqlite3.connect("data.sqlite")
c = conn.cursor()

CORS(app, resources=r"*")



@app.route('/query', methods=["POST"])
def query():
    if request.method =="POST":
        query = request.form["query"]
        print(query)
    else:
        return jsonify({"err": "Invalid parameters"})
    start_redis = time.time()
    redis.execute_command("REDISQL.EXEC", TABLE_NAME, query)
    end_redis = time.time() - start_redis

    start_sqlite = time.time()
    c.execute(str(query))
    end_sqlite = time.time() - start_sqlite

    return jsonify({
        "time_taken_redis": end_redis,
        "time_taken_sqlite": end_sqlite
    })


app.run(host='0.0.0.0', port='8080', debug=True)