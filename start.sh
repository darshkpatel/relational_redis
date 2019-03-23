#/bin/bash
# Run the script after installing the requirements and seeding the database

python app.py &
redis-server --loadmodule ~/Downloads/redisql/libredis_sql.so &
cd redis-stat/redis-stat/ && ruby -Ilib bin/redis-stat --server &
