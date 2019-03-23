#!/bin/bash
./start.sh
python load_db.py
sleep 10
curl -X POST -d 'query=SELECT * FROM test_data;' localhost:8080/query
