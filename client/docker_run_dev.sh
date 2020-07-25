#!/bin/bash

#-v /app/node_modules: Tells docker /app/node_modules should not be overriden by mounted volume (which is deleted on purpose in host)
docker run -p 3000:3000 \
-v /app/node_modules \
-v $(pwd):/app \
-t complex_demo_client

