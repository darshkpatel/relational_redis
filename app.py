from flask import Flask, jsonify, request
from flask_cors import CORS

app = Flask(__name__)
from connection import redis
from conf import TABLE_NAME
import time

CORS(app, resources=r"*")

@app.route('/query', methods=["POST"])
def query():
    if request.method =="POST":
        query = request.form["query"]
    else:
        return jsonify({"err": "Invalid parameters"})
    start = time.time()
    redis.execute_command("REDISQL.EXEC", TABLE_NAME, query)
    end = time.time() - start

    return jsonify({
        "time_taken": end
    })


app.run(host='0.0.0.0', port='5000', debug=True)
